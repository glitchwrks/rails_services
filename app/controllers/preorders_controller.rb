class PreordersController < ApplicationController
  before_filter :load_project, :only => [:new, :create, :success]

  def new
    @preorder = Preorder.new
  end

  def create
    @preorder = Preorder.new(preorder_parameters.merge(:address => request.remote_ip, :project => @project))

    if @preorder.valid? && verify_recaptcha
      PreorderProcessorService.new(@preorder).execute
      redirect_to success_project_preorders_path(@project)
    else
      render :new
    end
  end

  def success
  end

  def confirm
    @preorder = Preorder.find_by(:confirmation_token => params[:token])
    
    if @preorder.present?
      @preorder.becomes!(ConfirmedPreorder).save!
    else
      render :invalid_token
    end
  end

  private

  def preorder_parameters
    params.require(:preorder).permit(:email, :name, :boards, :kits, :assembled)
  end

  def load_project
    @project = Project.find_by!(:id => params[:project_id])
    redirect_to disabled_project_path(@project) unless @project.enabled?
  end

  def verify_recaptcha
    return true if RecaptchaVerificationService.new('preorder', params['g-recaptcha-response'], request.remote_ip).execute
    
    @preorder.errors[:base] << 'CAPTCHA failed, please try again'
    false
  end
end
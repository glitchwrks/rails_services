class Api::TestfdcResultsController < Api::ApiController

  before_action :load_testfdc_result, :only => [:show, :update, :destroy, :approve]

  def index
    render :json => TestfdcResult.order(:manufacturer).to_a
  end

  def show
    render :json => @testfdc_result
  end

  def create
    result = TestfdcResult.new(testfdc_result_parameters)

    if result.valid?
      result.save!
      head 201
    else
      render :json => result.errors, :status => 422
    end
  end

  def update
    @testfdc_result.update(testfdc_result_parameters)

    if @testfdc_result.valid?
      @testfdc_result.save!
      head 201
    else
      render :json => @testfdc_result.errors, :status => 422
    end
  end

  def destroy
    @testfdc_result.destroy!
    head 204
  end

  def unapproved
    render :json => TestfdcResult.where(:approved => nil).to_a
  end

  def approve
    @testfdc_result.approve!
    head 204
  end

  private

  def load_testfdc_result
    @testfdc_result = TestfdcResult.find(params[:id])
  end

  def testfdc_result_parameters
    params.require(:testfdc_result).permit(
      :manufacturer,
      :model,
      :fdc_chip,
      :hardware_class,
      :fm_250,
      :fm_300,
      :fm_500,
      :mfm_250,
      :mfm_300,
      :mfm_500,
      :mfm_250_128,
      :mfm_300_128,
      :mfm_500_128,
      :approved,
      :note_id
    )
  end
end


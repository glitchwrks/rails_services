class Api::PastesController < Api::ApiController

  def create
    paste = Paste.new(paste_parameters)

    if paste.valid?
      paste.save!
      head 201
    else
      render :json => paste.errors, :status => 422
    end
  end

  private

  def paste_parameters
    params.require(:paste).permit(:name, :content)
  end

end
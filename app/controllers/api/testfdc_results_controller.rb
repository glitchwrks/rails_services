class Api::TestfdcResultsController < Api::ApiController

  def index
    render :json => TestfdcResult.order(:manufacturer).to_a
  end

  def approve
    TestfdcResult.find(params[:id]).approve!
    head 200
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

  private

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


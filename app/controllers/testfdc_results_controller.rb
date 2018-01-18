class TestfdcResultsController < ApplicationController

  def index
    @testfdc_results = TestfdcResult.where(:approved => true).order(:manufacturer).to_a
    @notes = TestfdcNote.order(:number).to_a
  end

  def new
    @testfdc_result = TestfdcResult.new
  end

  def create
    @testfdc_result = TestfdcResult.new(testfdc_result_parameters)

    if @testfdc_result.valid? && @testfdc_result.save!
      redirect_to success_testfdc_results_path
    else
      render :new
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
      :initial_report_notes
    )
  end
end
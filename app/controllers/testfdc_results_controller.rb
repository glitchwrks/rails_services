class TestfdcResultsController < ApplicationController

  def index
    @testfdc_results = TestfdcResult.where(:approved => true).to_a
    @notes = TestfdcNote.order(:number).to_a
  end
end
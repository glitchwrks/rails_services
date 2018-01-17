class AddInitialReportNotesToTestfdcResult < ActiveRecord::Migration[5.0]
  def change
    add_column :testfdc_results, :initial_report_notes, :text
  end
end

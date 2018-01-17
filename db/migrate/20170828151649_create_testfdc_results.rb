class CreateTestfdcResults < ActiveRecord::Migration[5.0]
  def change
    create_table :testfdc_results, :id => false do |t|
      t.string :id, :limit => 36, :primary_key => true, :null => false
      t.string :manufacturer
      t.string :model
      t.string :fdc_chip
      t.string :hardware_class
      t.boolean :fm_250
      t.boolean :fm_300
      t.boolean :fm_500
      t.boolean :mfm_250
      t.boolean :mfm_300
      t.boolean :mfm_500
      t.boolean :mfm_250_128
      t.boolean :mfm_300_128
      t.boolean :mfm_500_128
      t.boolean :approved
      t.timestamps
    end
  end
end

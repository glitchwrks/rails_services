class CreateTestfdcNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :testfdc_notes, :id => false do |t|
      t.string :id, :limit => 36, :primary_key => true, :null => false
      t.integer :number
      t.string :description
      t.timestamps
    end

    add_column :testfdc_results, :note_id, :string
    add_index :testfdc_results, :note_id
  end
end

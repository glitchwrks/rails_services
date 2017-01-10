class CreateApplicationSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :application_settings, :id => false do |t|
      t.string :id, :limit => 36, :primary_key => true, :null => false
      t.string :name, :index => true
      t.string :description
      t.string :value
      t.string :sti_type
      t.timestamps
    end
  end
end

class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects, :id => false do |t|
      t.string :id, :limit => 36, :primary_key => true, :null => false
      t.string :name, :index => true
      t.string :printable_name
      t.timestamps
    end
  end
end

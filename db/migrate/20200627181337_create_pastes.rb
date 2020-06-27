class CreatePastes < ActiveRecord::Migration[6.0]
  def change
    create_table :pastes, :id => false do |t|
      t.string :id, :limit => 36, :primary_key => true, :null => false
      t.string :name, :limit => 8, :null => false
      t.text :content, :null => false
      t.timestamps
    end
  end
end

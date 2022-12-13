class CreatePreorders < ActiveRecord::Migration[5.0]
  def change
    create_table :preorders, :id => false do |t|
      t.string :id, :limit => 36, :primary_key => true, :null => false
      t.string :project_id, :limit => 36, :index => true
      t.string :name
      t.string :email
      t.string :boards
      t.string :kits
      t.string :assembled
      t.string :address
      t.string :confirmation_token, :index => true
      t.string :sti_type
      t.timestamps
    end
  end
end

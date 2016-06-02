class CreatePreorders < ActiveRecord::Migration
  def change
    create_table :preorders do |t|
      t.references :project
      t.string :name
      t.string :email
      t.string :boards
      t.string :kits
      t.string :assembled
      t.string :address
      t.string :confirmation_token
      t.string :sti_type
      t.timestamps
    end
  end
end

class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages, :id => false do |t|
      t.string :id, :limit => 36, :primary_key => true, :null => false
      t.string :name
      t.string :email
      t.string :subject
      t.string :check
      t.text :content
      t.string :address
      t.boolean :suspicious
      t.boolean :failed
      t.timestamps
    end
  end
end

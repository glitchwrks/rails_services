class AddConfirmedToPreorder < ActiveRecord::Migration[5.0]
  def change
  	add_column :preorders, :confirmed, :boolean
  	execute 'UPDATE preorders SET confirmed = TRUE WHERE sti_type = "ConfirmedPreorder"'
  	remove_column :preorders, :sti_type
  end
end

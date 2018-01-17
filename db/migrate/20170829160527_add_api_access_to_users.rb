class AddApiAccessToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :api_access, :boolean
  end
end

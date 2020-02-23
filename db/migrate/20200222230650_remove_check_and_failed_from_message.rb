class RemoveCheckAndFailedFromMessage < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :check
    remove_column :messages, :failed
  end
end

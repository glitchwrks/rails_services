class RemoveSaveFailedMessagesSetting < ActiveRecord::Migration[5.2]
  def up
    ApplicationSetting.find_by(:name => 'save_failed_messages').delete
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

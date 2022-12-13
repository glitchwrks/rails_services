class RemoveSaveFailedMessagesSetting < ActiveRecord::Migration[5.2]
  def up
    setting = ApplicationSetting.find_by(:name => 'save_failed_messages')
    setting.delete if setting.present?
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

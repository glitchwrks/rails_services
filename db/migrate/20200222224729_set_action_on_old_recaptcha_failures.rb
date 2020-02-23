class SetActionOnOldRecaptchaFailures < ActiveRecord::Migration[5.2]
  def up
  	execute 'UPDATE recaptcha_failures SET action = "preorder" WHERE action IS NULL'
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end

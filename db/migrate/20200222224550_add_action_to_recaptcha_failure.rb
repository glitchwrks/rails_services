class AddActionToRecaptchaFailure < ActiveRecord::Migration[5.2]
  def change
    add_column :recaptcha_failures, :action, :string
  end
end

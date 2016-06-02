class CreateRecaptchaFailures < ActiveRecord::Migration
  def change
    create_table :recaptcha_failures do |t|
      t.string :challenge_timestamp
      t.string :hostname
      t.string :address
      t.string :error_codes
      t.timestamps
    end
  end
end

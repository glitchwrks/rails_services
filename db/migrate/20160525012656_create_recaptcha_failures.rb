class CreateRecaptchaFailures < ActiveRecord::Migration
  def change
    create_table :recaptcha_failures, :id => false do |t|
      t.string :id, :limit => 36, :primary_key => true, :null => false
      t.string :challenge_timestamp
      t.string :hostname
      t.string :address
      t.string :error_codes
      t.timestamps
    end
  end
end

# Minimal data needed to develop with.

# Project related seeds
Project.create!(:name => 'test_project', :printable_name => 'Test Project', :enabled => true)

# Contact Us related seeds
BooleanSetting.create(:name => 'save_failed_messages', :description => 'Save messages that fail spam check', :value => 'true')
BooleanSetting.create(:name => 'save_suspicious_messages', :description => 'Save messages containing HTML', :value => 'true')
StringSetting.create(:name => 'contact_email', :description => 'Email destination for contact messages', :value => 'contact_test@glitchwrks.com')
require 'rails_helper'

RSpec.describe Api::AuthenticateUserService do
  let(:non_api_user) { User.create(:login => 'non_api_user', :password => 'non_api_password', :password_confirmation => 'non_api_password') }
  let(:api_user) { User.create(:login => 'api_user', :password => 'api_password', :password_confirmation => 'api_password', :api_access => true) }

  it { expect(Api::AuthenticateUserService.new(nil, nil).execute).to be_falsey }
  it { expect(Api::AuthenticateUserService.new(non_api_user.login, 'wrong').execute).to be_falsey }
  it { expect(Api::AuthenticateUserService.new(non_api_user.login, 'non_api_password').execute).to be_falsey }
  it { expect(Api::AuthenticateUserService.new(api_user.login, 'wrong').execute).to be_falsey }
  it { expect(Api::AuthenticateUserService.new(api_user.login, 'api_password').execute).to eq api_user }

end

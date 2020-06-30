require "rails_helper"

class Api::TestsController < Api::ApiController
  def index
  end
end

RSpec.describe Api::TestsController, :type => :controller do

  before do
    Rails.application.routes.draw do
      namespace :api, :constraints => { :format => 'json' } do
        resources :tests, :only => [:index]
      end
    end
  end

  after do
    Rails.application.reload_routes!
  end

  describe 'requires authentication' do
    it 'should give a 401 Unauthorized error' do
      get :index
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'with valid credentials' do
    let(:api_user) { FactoryBot.create(:api_user) }
    let(:non_api_user) { FactoryBot.create(:user) }

    it 'should be successful if user has API access' do
      http_basic_auth(api_user.login, 'testing')
      get :index, :format => :json
      expect(response).to have_http_status(:no_content)
    end

    it 'should fail if user does not have API access' do
      http_basic_auth(non_api_user.login, 'testing')
      get :index, :format => :json
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
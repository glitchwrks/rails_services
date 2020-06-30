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
    let!(:user) { FactoryBot.create(:api_user) }

    before(:each) do
      http_basic_auth(user.login, 'testing')
    end

    it 'should be successful' do
      get :index, :format => :json
      expect(response).to have_http_status(:no_content)
    end
  end
end
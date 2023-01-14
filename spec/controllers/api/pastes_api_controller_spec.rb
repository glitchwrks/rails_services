require 'rails_helper'

RSpec.describe Api::PastesController, :type => :controller do
  let!(:user) { FactoryBot.create(:api_user) }
  let(:parsed_json) { JSON.parse(response.body).with_indifferent_access }

        
  before(:each) do
    http_basic_auth(user.login, 'testing')
  end

  describe '#create' do
    describe 'with invalid parameters' do
      let(:invalid_params) { {:paste => {:name => '12inval'}} }
      
      before(:each) do
        post :create, :format => :json, :params => invalid_params
      end

      it { expect(response).to have_http_status(422) }
      it { expect(parsed_json[:content]).to include "can't be blank" }
    end

    describe 'with valid parameters' do
      let!(:new_paste) { FactoryBot.build(:valid_paste) }
      let(:result) { Paste.find_by(:name => new_paste.name) }

      before(:each) do
        post :create, :format => :json, :params => {:paste => new_paste.attributes}
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(result).to be_persisted }
      it { expect(result.name).to eq new_paste.name }
      it { expect(result.content).to eq new_paste.content }
    end
  end

end

require "rails_helper"

RSpec.describe Api::TestfdcResultsController, :type => :controller do
  let!(:user) { FactoryBot.create(:api_user) }
  let!(:testfdc_result) { FactoryBot.create(:testfdc_result) }
        
  before(:each) do
    http_basic_auth(user.login, 'testing')
  end

  describe 'index' do
    before(:each) do
      get :index, :format => :json
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(JSON.parse(response.body).first['model']).to eq testfdc_result.model }
  end

  describe 'approve a result' do
    it { expect(testfdc_result).not_to be_approved }

    it 'should be approved after hitting the endpoint' do
      put :approve, :format => :json, :params => {:id => testfdc_result.id}
      expect(response).to have_http_status(:no_content)
      expect(TestfdcResult.find(testfdc_result.id)).to be_approved
    end
  end

  describe 'delete a result' do
    it 'should delete the TestFDC result' do
      delete :destroy, :format => :json, :params => {:id => testfdc_result.id}
      expect(response).to have_http_status(:no_content)
      expect(TestfdcResult.all).not_to include(testfdc_result)
    end
  end

  describe '#unapproved' do
    let!(:approved_testfdc_result) { FactoryBot.create(:approved_testfdc_result) }

    before(:each) do
      get :unapproved, :format => :json
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(JSON.parse(response.body).size).to eq 1 }
    it { expect(JSON.parse(response.body).first['model']).to eq testfdc_result.model }
  end

  describe '#create' do
    let!(:new_testfdc_result) { FactoryBot.build(:approved_testfdc_result) }
    let(:result) { TestfdcResult.find_by(:model => new_testfdc_result.model) }

    before(:each) do
      post :create, :format => :json, :params => {:testfdc_result => new_testfdc_result.attributes}
    end

    it { expect(response).to have_http_status(:created) }
    it { expect(result).to be_persisted }
    it { expect(result).to be_approved }
  end
end

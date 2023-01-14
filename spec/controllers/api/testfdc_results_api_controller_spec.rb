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
    let!(:approved_testfdc_result) { FactoryBot.create(:testfdc_result, :approved) }

    before(:each) do
      get :unapproved, :format => :json
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(JSON.parse(response.body).size).to eq 1 }
    it { expect(JSON.parse(response.body).first['model']).to eq testfdc_result.model }
  end

  describe '#create' do
    describe 'with invalid parameters' do
      let(:parsed_json) { JSON.parse(response.body).with_indifferent_access }

      before(:each) do
        post :create, :format => :json, :params => {:testfdc_result => {:approved => true}}
      end

      it { expect(response).to have_http_status(422) }
      it { expect(parsed_json[:base]).to include 'You submitted a blank report; you must fill in something!' }
    end

    describe 'with valid parameters' do
      let!(:new_testfdc_result) { FactoryBot.build(:testfdc_result, :approved) }
      let(:result) { TestfdcResult.find_by(:model => new_testfdc_result.model) }

      before(:each) do
        post :create, :format => :json, :params => {:testfdc_result => new_testfdc_result.attributes}
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(result).to be_persisted }
      it { expect(result).to be_approved }
    end
  end

  describe '#show' do
    before(:each) do
      get :show, :format => :json, :params => {:id => testfdc_result.id}
    end

    it { expect(response).to have_http_status(:ok) }

    describe 'parsed JSON rendered' do
      let(:parsed_json) { JSON.parse(response.body).with_indifferent_access }
    
      it { expect(parsed_json[:id]).to eq testfdc_result.id }
      it { expect(parsed_json[:manufacturer]).to eq testfdc_result.manufacturer }
      it { expect(parsed_json[:model]).to eq testfdc_result.model }
      it { expect(parsed_json[:fdc_chip]).to eq testfdc_result.fdc_chip }
      it { expect(parsed_json[:hardware_class]).to eq testfdc_result.hardware_class }
    end

  describe '#update' do
      describe 'with invalid parameters' do
        let(:invalid_params) { {:model => '', :manufacturer => '', :fdc_chip => ''} }
        let(:parsed_json) { JSON.parse(response.body).with_indifferent_access }

        before(:each) do
          patch :update, :format => :json, :params => {:id => testfdc_result.id, :testfdc_result => invalid_params }
        end

        it { expect(response).to have_http_status(422) }
        it { expect(parsed_json[:base]).to include 'You submitted a blank report; you must fill in something!' }
      end

      describe 'with valid parameters' do
        let(:valid_params) { {:model => 'New Model'} }

        before(:each) do
          post :update, :format => :json, :params => {:id => testfdc_result.id, :testfdc_result => valid_params }
          testfdc_result.reload
        end

        it { expect(response).to have_http_status(:no_content) }
        it { expect(testfdc_result).to be_persisted }
        it { expect(testfdc_result.model).to eq 'New Model' }
      end
    end
  end
end

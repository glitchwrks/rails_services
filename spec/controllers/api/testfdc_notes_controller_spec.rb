require 'rails_helper'

RSpec.describe Api::TestfdcNotesController, :type => :controller do
  let!(:user) { FactoryBot.create(:api_user) }
  let!(:first_testfdc_note) { FactoryBot.create(:testfdc_note) }
  let!(:second_testfdc_note) { FactoryBot.create(:testfdc_note) }
        
  before(:each) do
    http_basic_auth(user.login, 'testing')
  end

  describe '#index' do  
    let(:parsed_json) { JSON.parse(response.body) }

    before(:each) do
      get :index, :format => :json
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(parsed_json.first['number']).to eq first_testfdc_note.number }
    it { expect(parsed_json.first['description']).to eq first_testfdc_note.description }
    it { expect(parsed_json.second['number']).to eq second_testfdc_note.number }
    it { expect(parsed_json.second['description']).to eq second_testfdc_note.description }
  end

  describe '#show' do
    let(:parsed_json) { JSON.parse(response.body).with_indifferent_access }

    before(:each) do
      get :show, :format => :json, :params => {:id => first_testfdc_note.id}
    end

    it { expect(response).to have_http_status(:ok) }    
    it { expect(parsed_json['number']).to eq first_testfdc_note.number }
    it { expect(parsed_json['description']).to eq first_testfdc_note.description }

  end

  describe '#create' do
    describe 'with invalid parameters' do
      let(:parsed_json) { JSON.parse(response.body).with_indifferent_access }

      before(:each) do
        post :create, :format => :json, :params => {:testfdc_note => {:number => 1}}
      end

      it { expect(response).to have_http_status(422) }
      it { expect(parsed_json[:description]).to include "can't be blank" }
    end

    describe 'with valid parameters' do
      let!(:new_testfdc_note) { FactoryBot.build(:testfdc_note) }
      let(:result) { TestfdcNote.find_by(:number => new_testfdc_note.number) }

      before(:each) do
        post :create, :format => :json, :params => {:testfdc_note => new_testfdc_note.attributes}
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(result).to be_persisted }
      it { expect(result.number).to eq new_testfdc_note.number }
    end
  end

end

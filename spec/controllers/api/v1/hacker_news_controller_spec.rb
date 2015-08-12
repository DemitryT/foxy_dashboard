require 'rails_helper'

describe Api::V1::HackerNewsController do
  let(:valid_api) { create :api_key }

  context '#index' do
    context 'unvalid api key' do
      it 'unauthorized' do
        get :index, { account: 'whatever', key: 'whatever' }
        expect(response).to have_http_status :unauthorized
      end
    end

    context 'api key blank' do
      it 'unauthorized' do
        get :index
        expect(response).to have_http_status :unauthorized
      end
    end

    context 'valid api key'  do
      it 'success' do
        get :index, { account: valid_api.account , key: valid_api.key }
        expect(response).to have_http_status :success
      end
    end
  end
end

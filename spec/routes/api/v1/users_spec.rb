# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Users' do
  let(:user) { User.create(first_name: 'John', last_name: 'Doe', password: '12341234', email: 'test@gmai.com') }
  let(:auth_headers) { auth_headers_for(user) }

  describe 'GET /api/v1/users' do
    context 'when records exist' do
      before do
        auth_headers
        get '/users'
      end

      it 'returns list of all entities' do
        expect(json).not_to be_empty
        expect(last_response).to be_ok
      end
    end
  end

  describe 'GET /api/v1/users/:id' do
    context 'when user exist' do
      before do
        auth_headers
        get "/users/#{user.id}"
      end

      it 'returns success status' do
        expect(json).not_to be_empty
        expect(json[:id]).to eq(user.id)
        expect(last_response).to be_ok
      end
    end
  end
end

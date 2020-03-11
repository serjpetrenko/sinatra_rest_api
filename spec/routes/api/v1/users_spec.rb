# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Users' do
  let(:user) do
    User.create(
      first_name: 'John', last_name: 'Doe', password: '12341234',
      email: 'test@gmail.com'
    )
  end
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

  describe 'POST /api/v1/users' do
    context 'when valid params' do
      let(:params) do
        {
          first_name: 'John', last_name: 'Doe', email: 'test@gmail.com',
          password: '12341234'
        }
      end

      before do
        auth_headers
      end

      it 'creates user record' do
        expect {
          post '/users', params.to_json
        }.to change { User.count }.by(1)
        expect(json[:first_name]).to eq(params[:first_name])
        expect(json[:last_name]).to eq(params[:last_name])
        expect(json[:email]).to eq(params[:email])
        expect(last_response.status).to eq(201)
      end
    end

    context 'when invalid params' do
      let(:params) do
        {
          first_name: 'Test', last_name: 'Doe', email: 'test@gmail.com',
          password: '12341234'
        }
      end

      before do
        auth_headers
        allow_any_instance_of(User).to receive(:save).and_return(false)
        post '/users', params.to_json
      end

      it 'creates user record' do
        expect {
          post '/users', params.to_json
        }.not_to change { User.count }
        expect(last_response.status).to eq(422)
      end
    end
  end

  describe 'PUT /api/v1/users/:id' do
    context 'when valid params' do
      before do
        auth_headers
        put "/users/#{user.id}", { first_name: 'Updated' }.to_json
      end

      it 'updates user record' do
        expect(json[:first_name]).to eq('Updated')
        expect(json[:last_name]).to eq(user.last_name)
        expect(json[:email]).to eq(user.email)
        expect(last_response).to be_ok
      end
    end

    context 'when invalid params' do
      before do
        auth_headers
        allow_any_instance_of(User).to receive(:update).and_return(false)
        put "/users/#{user.id}", { first_name: 'Updated' }.to_json
      end

      it 'updates user record' do
        expect(json[:first_name]).to eq(user.first_name)
        expect(json[:last_name]).to eq(user.last_name)
        expect(json[:email]).to eq(user.email)
        expect(last_response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /api/v1/users/:id' do
    context 'when valid record' do
      before do
        auth_headers
      end

      it 'deletes user record' do
        expect {
          delete "/users/#{user.id}"
        }.to change { User.count }.by(-1)

        expect(last_response.status).to eq(204)
      end
    end
  end
end

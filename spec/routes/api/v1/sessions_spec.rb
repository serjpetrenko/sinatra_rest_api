# frozen_string_literal: true

require 'spec_helper'

describe 'Sessions' do
  let(:user) { User.create(first_name: 'John', last_name: 'Doe', password: '12341234', email: 'test@gmai.com') }

  context 'when credentials correct' do
    it 'returns auth_token for user' do
      post '/sessions', { password: '12341234', email: user.email }.to_json
      expect(json[:auth_token]).not_to be_empty
      expect(json[:user]).not_to be_empty
    end
  end

  context 'when credentials not correct' do
    it 'returns error message' do
      post '/sessions', { password: '1234123', email: user.email }.to_json
      expect(json[:error]).to eq("Can't authenticate try again")
    end
  end
end

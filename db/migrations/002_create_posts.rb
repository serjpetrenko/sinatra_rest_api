# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:posts) do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      String :title, null: false
      String :body, null: false
      DateTime :created_at
      DateTime :updated_at
      foreign_key :user_id, :users, type: :uuid
    end
  end
end

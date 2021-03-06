# frozen_string_literal: true

Sequel.migration do
  change do
    run 'CREATE EXTENSION "uuid-ossp"'

    create_table(:users) do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      String :first_name, null: false
      String :last_name, null: false
      String :email, null: false
      String :password_digest, null: false
      DateTime :created_at
      DateTime :updated_at
    end
  end
end

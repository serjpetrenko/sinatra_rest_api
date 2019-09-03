# frozen_string_literal: true

class Post < Sequel::Model
  many_to_one :user
end

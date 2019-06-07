# frozen_string_literal: true

FactoryBot.define do
  factory :bucket do
    title { Faker::Books::Lovecraft.word }
    author { Faker::Name.name }
    user { nil }
  end
end

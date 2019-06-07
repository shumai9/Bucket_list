# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    title { 'MyString' }
    content { 'MyString' }
    bucket { nil }
  end
end

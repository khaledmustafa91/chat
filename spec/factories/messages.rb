# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    body { 'Message' }
    chat
  end
end

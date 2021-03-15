# frozen_string_literal: true

FactoryBot.define do
  factory :chatroom do
    sequence(:name) { |n| "Channel #{n}" }
    direct_message { false }
    purpose { Faker::Lorem.sentence }
    access { 0 }
    topic { Faker::Lorem.sentence }

    factory :public_chatroom do
      access { 1 }
    end
  end
end

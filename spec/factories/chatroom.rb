FactoryBot.define do
  factory :chatroom do
    sequence(:name) { |n| "Channel #{n}" }
    direct_message { false }
    purpose { Faker::Lorem.sentence }
    access { "private" }
    creator { "seunadex" }
    topic { Faker::Lorem.sentence }

    factory :public_chatroom do
      access { "public" }
    end
  end
end

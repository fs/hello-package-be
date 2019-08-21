FactoryBot.define do
  factory :room do
    token { Faker::Blockchain::Bitcoin.address }
    room_id { Faker::Blockchain::Bitcoin.address }
  end
end
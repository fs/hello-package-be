FactoryBot.define do
  factory :room do
    room_id { Faker::Blockchain::Bitcoin.address }
  end
end

FactoryBot.create :user, full_name: "Support"

user = FactoryBot.create :user, full_name: "Test User"
FactoryBot.create :room, user: user

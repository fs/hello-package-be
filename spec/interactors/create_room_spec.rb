require "rails_helper"

describe CreateRoom do
  subject(:context) { described_class.call(user: user) }

  let(:user) { create(:user) }

  describe ".call" do
    it "succeeds" do
      expect(context).to be_a_success
    end

    it "returns room for user" do
      expect(context.room).to be_a_kind_of(Room)
      expect(context.room.user).to eq(user)
    end
  end
end

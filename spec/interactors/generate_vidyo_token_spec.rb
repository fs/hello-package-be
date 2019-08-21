require "rails_helper"

describe GenerateVidyoToken do
  subject(:context) { described_class.call(user: user) }
  let(:user) { create(:user) }

  describe ".call" do
    it "succeeds" do
      expect(context).to be_a_success
    end

    it "provides token" do
      expect(context.token).to be_present
    end
  end
end

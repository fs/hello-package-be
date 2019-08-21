require "rails_helper"

resource "Support Rooms" do
  get "/v1/support/rooms" do
    before do
      allow(GenerateVidyoToken).to receive(:call)
        .with(user: current_user)
        .and_return(double(:context, token: token))
    end

    let(:token) { "vidyo-support-token" }
    let!(:current_user) { create :user }
    let!(:room) { create :room }

    let(:expected_response) do
      {
        meta: {
          support_token: token
        },
        rooms: [
          {
            id: room.id,
            name: room.name,
            user_name: room.user.full_name
          }
        ]
      }
    end

    example_request "List Rooms" do
      expect(response_status).to eq(200)
      expect(json_response_body).to eq(expected_response)
    end
  end
end

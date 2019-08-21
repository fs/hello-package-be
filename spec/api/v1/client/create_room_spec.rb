require "rails_helper"

resource "Client Rooms" do
  post "/v1/client/rooms" do
    let!(:user) { create :user }
    let!(:room) { create :room, user: user }

    let(:user_id) { user.id }
    parameter :user_id, "user_id"

    let(:expected_response) {
      {
        meta: {
          user_token: "vidyo-user-token"
        },
        room: {
          id: room.id
          name: room.name
        }
      }
    }

    example_request "Create Room for Client" do
      expect(response_status).to eq(201)
      expect(json_response_body).to eq(expected_response)
    end
  end
end

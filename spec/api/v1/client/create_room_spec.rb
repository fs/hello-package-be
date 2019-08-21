require "rails_helper"

resource "Client Rooms" do
  post "/v1/client/rooms" do
    before do
      allow(GenerateVidyoToken).to receive(:call)
        .with(user: user)
        .and_return(OpenStruct.new(token: token))
    end

    let(:token) { "vidyo-user-token" }
    let!(:user) { create :user }
    let!(:room) { create :room, user: user }

    let(:user_id) { user.id }
    parameter :user_id, "user_id"

    let(:expected_response) do
      {
        meta: {
          user_token: token
        },
        room: {
          id: room.id,
          name: room.name
        }
      }
    end

    example_request "Create Room for Client" do
      expect(response_status).to eq(201)
      expect(json_response_body).to eq(expected_response)
    end
  end
end

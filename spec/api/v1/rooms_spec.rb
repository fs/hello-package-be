require "rails_helper"

resource "Rooms" do
  let(:current_user) { create :user, email: "john.smith@example.com", full_name: "John Smith" }

  post "/v1/client/rooms" do
    parameter :user_id, "user_id"

    let(:keys) { %w[id room_id token] }
    let(:user_id) { current_user.id }

    example_request "Create Room with correct user_id" do
      expect(response_status).to eq(201)
      expect(json_response_body.keys).to eq(keys)
    end

    let(:user_id) { current_user.id - 1 }

    example_request "Create Room with uncorrect user_id" do
      expect(response_status).to eq(404)
    end
  end

  get "/v1/support/rooms" do
    let(:current_user) { create :user, email: "john.smith@example.com", full_name: "John Smith" }
    let!(:room) { create :room, user_id: current_user.id }

    example_request "Room#index" do
      expect(response_status).to eq(200)
    end
  end
end

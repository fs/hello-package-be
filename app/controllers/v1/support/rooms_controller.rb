module V1
  module Support
    class RoomsController < ActionController::API
      def index
        @rooms = Room.includes(:user).all

        render json: @rooms, each_serializer: RoomFullSerializer, meta: { token: token }, adapter: :json
      end

      private

      def token
        CreateCall::GenerateVidyoToken.call(user_id: current_user.id).token
      end

      def current_user
        User.first
      end
    end
  end
end

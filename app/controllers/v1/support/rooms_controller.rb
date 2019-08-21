module V1
  module Support
    class RoomsController < BaseController
      expose :rooms, :fetch_rooms

      def index
        render json: rooms, each_serializer: V1::Support::RoomSerializer, meta: meta
      end

      private

      def meta
        {
          support_token: GenerateVidyoToken.call(user: current_user).token
        }
      end

      def fetch_rooms
        Room.includes(:user).all
      end
    end
  end
end

module V1
  module Client
    class RoomsController < ActionController::API
      respond_to :json

      def create
        room = CreateCall::Create.call(user_params).room

        if room
          render json: room, status: :created, meta: { token: token }, adapter: :json
        else
          render json: room, status: 404
        end
      end

      private

      def user_params
        params.permit(:user_id)
      end

      def token
        CreateCall::GenerateVidyoToken.call(user_id: user_id).token
      end

      def user_id
        user_params[:user_id]
      end
    end
  end
end

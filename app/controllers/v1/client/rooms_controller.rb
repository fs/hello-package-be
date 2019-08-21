module V1
  module Client
    class RoomsController < BaseController
      def create
        context = CreateRoom.call(user: current_user)

        if context.success?
          render json: context.room, meta: meta, status: :created
        else
          respond_with_error status: :unprocessable_entity, error: context.error
        end
      end

      private

      def meta
        {
          user_token: GenerateVidyoToken.call(user: current_user).token,
        }
      end
    end
  end
end

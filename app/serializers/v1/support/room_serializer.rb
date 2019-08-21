module V1
  module Support
    class RoomSerializer < ApplicationSerializer
      attributes :id, :name, :user_name

      def user_name
        object.user.full_name
      end
    end
  end
end

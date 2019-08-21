module V1
  module Support
    class RoomFullSerializer < V1::Client::RoomSerializer
      attributes :username, :created_at

      def username
        object.user.full_name
      end
    end
  end
end

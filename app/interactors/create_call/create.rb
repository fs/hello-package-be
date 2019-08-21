module CreateCall
  class Create
    include Interactor

    delegate :user_id, to: :context

    def call
      user = User.find(user_id)
      context.fail! unless user
      context.room = user.rooms.update_or_create_by({ user: user }, room_id: room_id)
    end

    private

    def room_id
      "#{user_id}_#{Time.now.to_i}"
    end
  end
end

class CreateRoom
  include Interactor

  delegate :user, to: :context

  def call
    context.room = Room.find_or_create_by!(user: user)
  rescue ActiveRecord::RecordInvalid => e
    context.fail!(error: e.to_s)
  end
end

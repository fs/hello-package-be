class GenerateVidyoToken
  include Interactor

  TOKEN_TTL = 1.hour.to_i

  delegate :user, to: :context
  delegate :id, to: :user, prefix: true

  def call
    context.token = create_token
  end

  private

  def create_token
    Vidyo::Token.new(
      key: ENV.fetch("VIDYO_DEVELOPER_KEY"),
      application_id: ENV.fetch("VIDYO_APPLICATION_ID"),
      user_name: user_id,
      expires_in: TOKEN_TTL
    ).serialize
  end
end

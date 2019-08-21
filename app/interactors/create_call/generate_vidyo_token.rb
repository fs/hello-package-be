module CreateCall
  class GenerateVidyoToken
    include Interactor

    delegate :user_id, to: :context

    def call
      context.token = create_token
    end

    private

    def create_token
      @token ||= Vidyo::Token.new(
        key: ENV["VIDYO_DEVELOPER_KEY"],
        application_id: ENV["VIDYO_APPLICATION_ID"],
        user_name: user_id,
        expires_in: 3600
      )
      @token.serialize
    end
  end
end

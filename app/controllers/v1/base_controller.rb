module V1
  class BaseController < ActionController::API
    self.responder = ::ApiResponder
    respond_to :json

    private

    def respond_with_error(status: :internal_server_error, error:)
      render json: { error: error } , status: :status
    end

    def current_user
      @current_user ||= User.find_by(id: params[:user_id]) || User.first
    end
  end
end

class IncomingMessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    router = SubcommandRouter.new(text: create_params[:text])

    render json: router.handler.response.to_json
  end

  private

  def create_params
    params.permit(:token, :command, :text, :user_id, :user_name)
  end
end

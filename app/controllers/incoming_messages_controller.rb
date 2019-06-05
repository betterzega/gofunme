class IncomingMessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    router = SubcommandRouter.new(text: create_params[:text])
    handler = router.handler_class.new(create_params)
    handler.process
    render json: handler.response.to_json
  end

  private

  def create_params
    params.permit(:text, :user_id, :user_name)
  end
end

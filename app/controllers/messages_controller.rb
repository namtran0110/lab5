class MessagesController < ApplicationController

  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.create message_params
    # @message = Message.create(body: params[:message][:body])
    ActionCable.server.broadcast('chat', message: @message.body)
    redirect_to root_path
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end

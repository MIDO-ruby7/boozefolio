class RoomsController < ApplicationController
  layout 'timeline'

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      render_message_and_broadcast(@message)
      render json: { message: render_to_string(partial: 'messages/message', locals: { message: @message }) }
    else
      flash.now[:alert] = 'メッセージが送信できませんでした。'
      render json: { error: 'メッセージが送信できませんでした。' }, status: :unprocessable_entity
    end
  end

  def show
    @message = Message.new
    @messages = Message.includes(:user).all.order(created_at: :desc)
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end

  def render_message_and_broadcast(message)
    rendered_message = ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    ActionCable.server.broadcast('room_channel', { message: rendered_message })
  end
end

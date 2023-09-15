class RoomsController < ApplicationController
  layout 'timeline'

  def create
    @message = current_user.messages.build(message_params)
    content = @message.content
    client = ::OpenAI::Client.new

    if @message.save
      response_content = Openai.openai_response(content)  # AIからのレスポンスを生成
      @message.update(boo_response: response_content) # AIからのレスポンスを保存
      @active_stamp = MessageStampRelationship.includes(:stamp).all
      render_message_and_broadcast(@message, @active_stamp)
      render json: { message: render_to_string(partial: 'messages/message', locals: { message: @message }) }
    else
      render json: { error: @message.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def show
    @message = Message.new
    @messages = Message.includes(:user).all
    @stamps = Stamp.all
    @active_stamp = MessageStampRelationship.select('DISTINCT ON (message_id, stamp_id) *').includes(:stamp).all
    @stamp_counts = calculate_stamp_counts(@messages)
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :boo_response)
  end

  def render_message_and_broadcast(message, active_stamp)
    rendered_message = ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message, active_stamp: active_stamp })
    ActionCable.server.broadcast('room_channel', { message: rendered_message, boo_response: message.boo_response })
  end

  def calculate_stamp_counts(messages)
    stamp_counts = {}
    messages.each do |message|
      stamp_counts[message.id] = stamp_counts_for_message(message.id)
    end
    stamp_counts
  end

  def stamp_counts_for_message(message_id)
    MessageStampRelationship.stamp_count_for_message(message_id)
  end
end

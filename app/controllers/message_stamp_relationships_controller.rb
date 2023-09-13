class MessageStampRelationshipsController < ApplicationController
  before_action :set_message, only: %i[create destroy]
  before_action :set_stamp, only: %i[create destroy]

  def create
    existing_relationship = MessageStampRelationship.find_by(user: current_user, message: @message, stamp: @stamp)
    if existing_relationship
      current_user.cancel_stamp(@message, @stamp)
      redirect_to rooms_show_path
    else
      current_user.stamp(@message, @stamp)
      redirect_to rooms_show_path
    end
  end

  def destroy
    current_user.cancel_stamp(@message, @stamp)
  end

  private

  def set_message
    @message = Message.find(params[:message_id])
  end

  def set_stamp
    @stamp = Stamp.find(params[:stamp_id])
  end

  def message_stamp_relationship_params
    params.require(:message_stamp_relationship).permit(:message_id, :stamp_id)
  end
end

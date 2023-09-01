class RoomChannel < ApplicationCable::Channel
  def subscribed
    #room_channel.rbとroom_channel.js）でデータを送受信
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def submit_answer(data)
    @player = Player.find(data["id"])
    @player.select_answer(data["selected"].to_i)
    Room.find(@player.room_id).check_if_ready
    ActionCable.server.broadcast "room_channel", selected: data["selected"]
  end
end

class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def start_listening(data)
    stop_all_streams
    stream_for Room.find(data['room_id'])
  end

  def submit_answer(data)
    @player = Player.find(data["id"])
    @player.select_answer(data["selected"].to_i)
    @room = Room.find(@player.room_id)
    @room.check_if_ready
    # RoomChannel.broadcast_to(@room, selected: data["selected"])
    RoomChannel.broadcast_to("room_host_#{@room.id}", selected: data["id"])
  end

  def start_game(data)
    @room = Room.find(data["room_id"])
    RoomChannel.broadcast_to(@room, blank: true)
    @room.start_game
  end
end

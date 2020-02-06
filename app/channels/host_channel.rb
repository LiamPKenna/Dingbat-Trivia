class HostChannel < ApplicationCable::Channel

  def ask_question(data)
    @room = Room.find(data['room_id'])
    @room.ask_question
  end

  def start_hosting(data)
    stop_all_streams
    stream_for "room_host_#{data['room_id']}"
  end

  def end_question(data)
    @room = Room.find(data['room_id'])
    @room.end_question(data['loop_number'])
  end

  def kill
    stop_all_streams
  end
end

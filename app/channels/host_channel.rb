class HostChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def begin
  end

  def start_hosting(data)
    stop_all_streams
    stream_for "room_host_#{data['room_id']}"
  end
end

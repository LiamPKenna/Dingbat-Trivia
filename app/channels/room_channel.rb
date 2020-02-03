class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def submit_answer(data)
    @player = Player.find(data["id"])
    @player.current_answer = data["selected"].to_i
    binding.pry
  end
end

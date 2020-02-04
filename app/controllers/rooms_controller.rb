class RoomsController < ApplicationController
  protect_from_forgery

  def new
  end

  def join

  end

  def show
    @player = Player.find(params[:id])
    @room = Room.find(params[:room_id])
  end

  def host

    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.create!()
    redirect_to "/rooms/#{@room.id}"
  end

  def new_player
    @room = Room.find(params[:player][:room_id])
    if @room
      updated_params = player_params
      updated_params[:room_id] = params[:player][:room_id]
      @player = Player.create!(updated_params)
      HostChannel.broadcast_to("room_host_#{@room.id}", selected: "New player: #{@player.name}")
      redirect_to "/rooms/#{@room.id}/players/#{@player.id}"
    else
      render :join
    end
  end

  private
  def player_params
    params.require(:player).permit(:name)
  end
end

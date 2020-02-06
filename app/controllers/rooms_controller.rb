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

    @room = Room.create!( image_numbers: (1..8).to_a.shuffle!.join(',') )
    redirect_to "/rooms/#{@room.id}"
  end

  def new_player

    begin
      @room = Room.find(params[:player][:room_id])
    rescue ActiveRecord::RecordNotFound => e
      @room = nil
    end
    if @room
      if @room.players.length < 8
        updated_params = player_params
        updated_params[:room_id] = params[:player][:room_id]
        updated_params[:player_icon] = "/bat#{@room.get_image_number}.png"
        updated_params[:player_color] = "#{rand(0..255)} #{rand(0..255)} #{rand(0..255)}"
        @player = Player.create!(updated_params)
        HostChannel.broadcast_to("room_host_#{@room.id}", selected: @player.id)
        @room.push_player(@player)
        redirect_to "/rooms/#{@room.id}/players/#{@player.id}"
      else
        flash[:alert] = "Room is full"
        render :join
      end
    else
      flash[:alert] = "Room does not exist"
      render :join
    end
  end

  private
  def player_params
    params.require(:player).permit(:name)
  end
end

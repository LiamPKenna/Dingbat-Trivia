class RoomsController < ApplicationController
  protect_from_forgery

  def new
  end

  def join

  end

  def show
    begin
      @player = Player.find(params[:id])
      @room = Room.find(params[:room_id])
      render :show
    rescue ActiveRecord::RecordNotFound => e
      flash[:alert] = "Room does not exist"
      puts e
      render :join
    end
  end

  def host
    begin
      @room = Room.find(params[:room_id])
      render :host
    rescue ActiveRecord::RecordNotFound => e
      flash[:alert] = "Room does not exist"
      puts e
      render :new
    end
  end

  def create
    @room = Room.create!( image_numbers: (1..8).to_a.shuffle!.join(',') )
    @room.ready()
    redirect_to "/rooms/#{@room.id}"
  end

  def new_player
    begin
      @room = Room.find(params[:player][:room_id])
    rescue ActiveRecord::RecordNotFound => e
      @room = nil
      puts e
    end
    if @room
      if @room.players.length < 8
        updated_params = player_params
        updated_params[:room_id] = params[:player][:room_id]
        updated_params[:player_icon] = "/img/bat#{@room.get_image_number}.png"
        updated_params[:player_color] = "#{rand(0..255)} #{rand(0..255)} #{rand(0..255)}"
        @player = Player.create!(updated_params)
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

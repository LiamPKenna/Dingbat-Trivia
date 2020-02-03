class RoomsController < ApplicationController
  def new
  end

  def join
  end

  def show
    @player = Player.find(params[:id])
    @room = Room.find(params[:room_id])
  end

  def host
  end
end

class Api::RoomsController < ApplicationController
def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

def show
  @rooms = Room.all
  respond_to do |format|
      format.json { render :file => "/api/rooms/show.json.erb", :content_type => 'application/json' }
  end
end
       
end
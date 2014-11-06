class Api::RoomsController < ApplicationController
def create
    @room = Room.new(room_params)
    if @room.save
      @membership = Membership.new(:user_id=>params[:id],:room_id=>@room.id)
    end
    respond_to do |format|
        if @membership.save
            format.json { render :file => "/api/rooms/created.json.erb", :content_type => 'application/json' }
        else
            format.json { render :file => "/api/rooms/error.json.erb", :content_type => 'application/json' }
        end
    end
  end

def show
  @rooms = Room.all
  respond_to do |format|
      format.json { render :file => "/api/rooms/show.json.erb", :content_type => 'application/json' }
  end
end
    def room_params
      params.require(:room).permit(:accessPoint, :name)
    end


       
end
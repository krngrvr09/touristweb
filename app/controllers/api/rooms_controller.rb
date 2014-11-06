class Api::RoomsController < ApplicationController
def create
    @room = Room.new(room_params)
    @room.createdById = params[:id]
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
  @roomCheckedIn = Room.where(:createdById => params[:id]).first.id
  respond_to do |format|
      format.json { render :file => "/api/rooms/show.json.erb", :content_type => 'application/json' }
  end
end

def checkin
  roomId = params[:room_id]
  userId = params[:user_id]
  user = User.find(userId)
  user.checkedIn = roomId
  respond_to do |format|
      if user.save
            format.json { render :file => "/api/rooms/created.json.erb", :content_type => 'application/json' }
        else
            format.json { render :file => "/api/rooms/error.json.erb", :content_type => 'application/json' }
        end
      end
    
end
    def room_params
      params.require(:room).permit(:accessPoint, :name)
    end


       
end
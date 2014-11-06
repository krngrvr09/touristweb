class Api::UsersController < ApplicationController
#before_filter :restrict_access
#skip_before_filter :verify_authenticity_token 

	def showdata
      @haha = "hahaha"
  		respond_to do |format|
          format.json { render :file => "/api/users/showdata.json.erb", :content_type => 'application/json' }
       	end
    end
    
    def show
        @users = User.all
       	respond_to do |format|
          format.json { render :file => "/api/users/show.json.erb", :content_type => 'application/json' }
       	end
	end
       
    def showall
       	@memberships = Membership.where(:room_id => params[:id])
       	@usernames = Array.new
       	@whereusers = Array.new
       	@memberships.each do |member|
       		@usernames.push(User.find(member.user_id).name)
       		@whereusers.push(User.find(member.user_id).checkedIn)

       	end
       respond_to do |format|
          format.json { render :file => "/api/users/showall.json.erb", :content_type => 'application/json' }
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

	def checkout
		userId = params[:user_id]
		user = User.find(userId)
  		user.checkedIn = 0
		respond_to do |format|
      		if user.save
            	format.json { render :file => "/api/rooms/created.json.erb", :content_type => 'application/json' }
        	else
            	format.json { render :file => "/api/rooms/error.json.erb", :content_type => 'application/json' }
        	end
      	end
	end


end
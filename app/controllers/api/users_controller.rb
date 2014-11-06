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
       respond_to do |format|
          format.json { render :file => "/api/users/showall.json.erb", :content_type => 'application/json' }
       end

        	
        end
end
class Api::UsersController < ApplicationController
#before_filter :restrict_access
#skip_before_filter :verify_authenticity_token 

	def showdata
      @haha = "hahaha"
  		respond_to do |format|
          format.json { render :file => "/api/users/showdata.json.erb", :content_type => 'application/json' }
       end
        end
end
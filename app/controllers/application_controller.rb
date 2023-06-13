class ApplicationController < ActionController::Base
 before_action :authenticate_member!
 load_and_authorize_resource

 def current_user
    current_member
 end  
 rescue_from CanCan::AccessDenied do |exception|
   redirect_to request.referrer, :alert => exception.message
 end
end

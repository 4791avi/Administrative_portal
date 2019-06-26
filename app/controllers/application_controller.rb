class ApplicationController < ActionController::Base
	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def authorize
		 if current_user.nil?
			 render json: {status: "ERROR", message: "User is invalid", data: current_user}, status: :unprocessable_entity
		 end
		 if current_user.user_active == false or current_user.user_active == nil
			 render json: {status: "ERROR", message: "User is deactivated", data: current_user}, status: :unprocessable_entity
		 end

	end

end

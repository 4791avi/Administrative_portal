module Api
	module V1
		class SessionsController < ApplicationController
			skip_before_action :verify_authenticity_token
			def new
			end

			def create
			  user = User.find_by_email(params[:email])
			  if user && user.authenticate(params[:password])
			    session[:user_id] = user.id
			    render json: {status: "SUCCESS", message: "Logged in!", data: ''}, status: :ok
			  else
			  	render json: {status: "ERROR", message: "Email or password is invalid", data: user.errors}, status: :unprocessable_entity
			  end
			end

			def destroy
			  session[:user_id] = nil
			  render json: {status: "SUCCESS", message: "Logged out!", data: ''}, status: :ok
			end
		end
	end
end
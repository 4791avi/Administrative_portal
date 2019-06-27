module Api
	module V1
		class UsersController < ApplicationController
			skip_before_action :verify_authenticity_token
			before_action :authorize

			def index
				users = User.all
				render json: {status: "SUCCESS", message: "Loaded Users", data: users}, status: :ok 
			end

			def new
			  @user = User.new
			end

			def create
			  @user = User.new(user_params)
			  if @user.save
			    session[:user_id] = @user.id
			    render json: {status: "SUCCESS", message: "User Saved", data: @user}, status: :ok
			  else
			  	render json: {status: "ERROR", message: "User not saved", data: @user.errors}, status: :unprocessable_entity
			  end
			end

			def show
				user = User.find(params[:id])
				render json: {status: "SUCCESS", message: "Loaded Users", data: user}, status: :ok 				
			end

			def edit
			end


			def update
				user = User.find(params[:id])
				if user.update_attributes(user_params)
					  render json: {status: "SUCCESS", message: "User Updated", data: user}, status: :ok
				else
					render json: {status: "ERROR", message: "User not updated", data: user.errors}, status: :unprocessable_entity
				end
			end

			def destroy
				if params[:id]
					user = User.find(params[:id])
					user.destroy
					render json: {status: "SUCCESS", message: "User deleted succesfully", data: user}, status: :ok
				else
					render json: {status: "ERROR", message: "User not found with id", data: params[:id]}, status: :unprocessable_entity
				end
			end

			def sorting
				if params[:sort]
					if params[:sort] == "email"
						users = User.order("email")
					end
					if params[:sort] == "mobile"
						users = User.order("mobile")
					end
					if params[:sort] == "name"
						users = User.order("name")
					end
					if params[:sort] == "city"
						users = User.order("city")
					end	
					render json: {status: "SUCCESS", message: "Sorted Users", data: users}, status: :ok 
				else
					render json: {status: "ERROR", message: "sorting is not valid", data: user.errors}, status: :unprocessable_entity
				end				
			end

			def filters
				if params[:email]	
					users = User.where(email: params[:email])
				end
				if params[:mobile]
					users = User.where(mobile: params[:mobile])
				end
				if params[:name]
					users = User.where(name: params[:name])
				end
				if params[:city]
					users = User.where(city: params[:city])
				end	
					render json: {status: "SUCCESS", message: "Loaded Users", data: users}, status: :ok 		
			end

			def user_status
				user = User.find(params[:id])
				if user
					user.user_active = params[:ability]
					render json: {status: "SUCCESS", message: "User deleted succesfully", data: user}, status: :ok
				else
					render json: {status: "ERROR", message: "User not found with id", data: params[:id]}, status: :unprocessable_entity
				end
			end

			private

			def user_params
				params.permit(:name, :email, :password, :city, :mobile, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
			end
		end
	end
end
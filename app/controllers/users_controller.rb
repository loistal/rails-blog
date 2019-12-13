class UsersController < ApplicationController

	before_action :set_user, only: [:edit, :update, :show]

	def index 
		@users = User.all 
	end

	def new 
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save 
			flash[:success] = "Thanks for signing up #{@user.username}"
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def edit

	end


	def update

	end

	def show

	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end

		def set_user
			@user = User.find(params[:id])
		end
end
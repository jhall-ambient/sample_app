class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])  # Rails passes a hash of hashes called user
  	if @user.save
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
end

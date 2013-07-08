class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  	params.permit!
    @user = User.new(params[:user])
    if @user.save
      redirect_to products_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    params.permit!
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to products_url, :notice => "Profile was successfully updated"
    else
      render "show"
    end
  end
end

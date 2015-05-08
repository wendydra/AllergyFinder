class TriggersController < ApplicationController
  def index 
    @user = User.find(session[:user_id])
    @triggers = Trigger.where(user_id:session[:user_id], trigger: true)
    @safes = Trigger.where(user_id:session[:user_id], trigger: false)
  end

  def create
    @trigger = Trigger.create(ingredient: params[:ingredient], trigger: params[:bool].to_i, user_id: params[:user])
    redirect_to '/dataTable'
  end

  def update
  end

  def edit
  end

  def show
  end

  def destroy
  end
end

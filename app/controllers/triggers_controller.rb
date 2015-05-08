class TriggersController < ApplicationController
  def index 
    @user = User.find(session[:user_id])
    @triggers = Trigger.where(user_id:session[:user_id], trigger: true)
    @safes = Trigger.where(user_id:session[:user_id], trigger: false)
  end

  def create
    if Trigger.exists?(user_id:session[:user_id], ingredient:params[:ingredient])
      Trigger.where(user_id:session[:user_id], ingredient:params[:ingredient]).first.update(trigger:params[:bool].to_i)
    else
      @trigger = Trigger.create(ingredient: params[:ingredient], trigger: params[:bool].to_i, user_id: params[:user])
    end
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

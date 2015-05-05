class MainsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end

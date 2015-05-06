class ReactionsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end

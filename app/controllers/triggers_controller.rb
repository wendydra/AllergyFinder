class TriggersController < ApplicationController
  def index
  end

  def create
    @trigger = Trigger.create(ingredient: params[:ingredient], trigger: params[:bool], user_id: params[:user])
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

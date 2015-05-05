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

  def test
    @test = params[:output]
    @category = params[:category]

    # Queries in Waiting
    # User.find(session[:user_id]).meals.create(symptom_id: params[:symptom]).ingredients.create(name: params[:ingredient], category_id: params[:category_id])
  end
end

class MealsController < ApplicationController
  def index
    if flash[:meal_id]
       @meal = Meal.find(flash[:meal_id])
    end
    @symptoms = Symptom.all
    @user = User.find(session[:user_id])
  end

  def show
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      flash[:meal_id] = @meal.id
      redirect_to '/meals'
    else
      redirect_to '/meals'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
  def meal_params
    params.require(:meal).permit(:user_id, :symptom_id, :severity, :meal_pic)
  end

end

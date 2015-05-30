class MealsController < ApplicationController
  before_action :require_basic_vars

  def index
    if session[:meal_id]
       @meal = Meal.find(session[:meal_id])
       @time = @meal.created_at.strftime("%B-%d-%Y %I:%M %p")
       @day = @meal.created_at.strftime("%A")
    end
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      session[:meal_id] = @meal.id
      redirect_to '/meals'
    else
      redirect_to '/meals'
    end
  end

  def ingredients
    @items = params[:output]
    @items.each do |key, values|
      values.each do |ingr|
        Ingredient.create(name:ingr, meal_id: session[:meal_id], category_id: key)
      end
    end
    session[:meal_id] = nil
    redirect_to '/meals'
  end  

  def mealhistory
     @meal = Meal.where(user_id: session[:user_id])
  end

  private
  def meal_params
    params.require(:meal).permit(:user_id, :meal_pic)
  end
  def require_basic_vars
    @user = User.find(session[:user_id])
    @symptoms = Symptom.all
  end
end

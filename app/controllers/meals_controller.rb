class MealsController < ApplicationController
  def index
    if session[:meal_id]
       @meal = Meal.find(session[:meal_id])
       @time = @meal.created_at.strftime("%B-%d-%Y %I:%M %p")
       @day = @meal.created_at.strftime("%A")
    end
    @symptoms = Symptom.all
    @user = User.find(session[:user_id])
  end

  def show
  end

  def new
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

  def update
  end

  def edit
  end

  def destroy
  end

  private
  def meal_params
    params.require(:meal).permit(:user_id, :meal_pic)
  end

end

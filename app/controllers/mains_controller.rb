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
    @user = User.find(session[:user_id])
    @ingredients = Ingredient.all
    @reactions = Reaction.all

    @foods = Hash.new
    @ingredients.each do |ingredient|
      if ingredient.meal.user.id == @user.id
        if @foods[ingredient.name]
          @foods[ingredient.name] = @foods[ingredient.name] + 1
        else
          @foods[ingredient.name] = 1
        end
      end
    end

    @doof = Hash.new
    @reactions.each do |reaction|
      if reaction.symptom_id == 1 && reaction.meal.user.id == @user.id
        @ingredients.each do |ingredient|
          if ingredient.meal.user.id == @user.id && ingredient.meal_id == reaction.meal_id
            if @doof[ingredient.name]
              @doof[ingredient.name] = @doof[ingredient.name] + 1
            else
              @doof[ingredient.name] = 1
            end
          end
        end
      end
    end

    # @stuff = Hash.new
    # @foods.each do |key, food|
    #   @stuff[name] = key
      
    # end


  end #end test def

end

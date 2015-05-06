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
    @symptoms = Symptom.all
    
    if params[:symptom]
      @symptomName = Symptom.find(params[:symptom])
      @symptomNum = params[:symptom].to_i
    else
      @symptomNum = 1
    end

    #  Generates has of sum of all ingredients a user has in the DB
    @totalIngredients = Hash.new
    @ingredients.each do |ingredient|
      if ingredient.meal.user.id == @user.id
        if @totalIngredients[ingredient.name]
          @totalIngredients[ingredient.name] = @totalIngredients[ingredient.name] + 1
        else
          @totalIngredients[ingredient.name] = 1
        end
      end
    end

    # Generates a hash of sum of reactions to a specific ingredient
    @reactionsTotal = Hash.new
    @reactions.each do |reaction|
      if reaction.symptom_id == @symptomNum && reaction.meal.user.id == @user.id
        @ingredients.each do |ingredient|
          if ingredient.meal.user.id == @user.id && ingredient.meal_id == reaction.meal_id
            if @reactionsTotal[ingredient.name]
              @reactionsTotal[ingredient.name] = @reactionsTotal[ingredient.name] + 1
            else
              @reactionsTotal[ingredient.name] = 1
            end
          end
        end
      end
    end

    #  Generates a hash to be sent to view containing data for all totals
    @totalsHash = Hash.new
    @totalIngredients.each do |key, food|
      @totalsHash[key] = food,0
    end
    @reactionsTotal.each do |key, reactionsTotal|
      @totalsHash[key][1] = reactionsTotal
    end


  end #end test def

end

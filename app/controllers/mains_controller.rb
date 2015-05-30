class MainsController < ApplicationController
  #Requires user session data for entire controller
  before_action :require_basic_vars

  def index
  end

  def show
    #Graph Variables
    @ingredients = Ingredient.all
    @reactions = Reaction.all

    #Sums the ingredients into categories hash
    @totalCategory = Hash.new
    @ingredients.each do |ingredient|
      if ingredient.meal.user.id == @user.id
        if @totalCategory[ingredient.category_id]
          @totalCategory[ingredient.category_id] = @totalCategory[ingredient.category_id] + 1
        else
          @totalCategory[ingredient.category_id] = 1
        end
      end
    end

    @dataOutput = [0,0,0,0,0,0]
    @totalCategory.each do |index, value|
      @dataOutput[index-1] = value; 
    end

  end

  def dataTable
    @ingredients = Ingredient.all
    @reactions = Reaction.all
    @symptoms = Symptom.all
    
    if params[:symptom]
      @symptomName = Symptom.find(params[:symptom])
      @symptomNum = params[:symptom].to_i
    elsif flash[:symptomNum]
      @symptomName = Symptom.find(flash[:symptomNum])
      @symptomNum = flash[:symptomNum].to_i
    else
      @symptomName = Symptom.first
      @symptomNum = 1
    end

    #  Generates hash of sum of all ingredients a user has in the DB
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
      @totalsHash[key] = 0,food,0
    end
    @reactionsTotal.each do |key, reactionsTotal|
      @totalsHash[key][2] = reactionsTotal
      @totalsHash[key][0] = ((@totalsHash[key][2].to_f / @totalsHash[key][1].to_f)*100).round(2)  # finds percentage occurance of reaction
    end

    # Sorts totals hash by largest to smallest percentage of reaction
    @stuff = @totalsHash.sort_by { |key, val| val }.reverse
    @sortedHash = Hash.new
    @stuff.each do |val|
      @sortedHash[val[0]] = val[1]
    end
  end #end dataTable def

  private
  def require_basic_vars
    @user = User.find(session[:user_id])
  end

end

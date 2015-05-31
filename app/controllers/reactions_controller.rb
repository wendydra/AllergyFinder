class ReactionsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @symptoms = Symptom.all
    @time = Time.new.strftime("%I:%M %p")
    @date = Time.new.strftime("%B %d, %Y")
    if flash[:success]
      @success_msg = flash[:success]
    end
  end

  def create
    Meal.where(user_id: session[:user_id]).last.reactions.create(symptom_id: params[:symptom_id], severity: params[:severity_level].to_i)
    flash[:success] = "Your reaction has been recorded."
    redirect_to '/reactions'
  end

end

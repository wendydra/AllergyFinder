class UsersController < ApplicationController
  def index
    if flash[:errors]
      @errors = flash[:errors]
    end
    if flash[:success]
      @success = flash[:success]
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created!"
      session[:user_id] = @user.id
      redirect_to '/mains'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

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

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created!"
      redirect_to '/mains'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users'
    end
  end

  def update
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end

class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
  end

  def signin
  end

  def signup
    @user = User.new
  end

  def logout
  end

  def show
  end

  #POST /users
  #POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        #flash[:success] = "注册成功"
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'signup' }
        format.json { jrender json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

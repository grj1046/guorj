class UsersController < ApplicationController

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
    @user = User.find(params[:id])
  end
end

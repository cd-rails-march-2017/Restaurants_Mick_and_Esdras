class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:id] = user.id
      redirect_to '/'
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  def login
    if User.exists?(:username => params[:user]['username'])
      user = User.find_by_username(params[:user]['username'])
      if user.password == params[:user]['password']
        session[:id] = user.id
        redirect_to '/'
      else
        redirect_to :back, notice: "That password does not match"
      end
    else
      redirect_to :back, notice: "That username does not exist"
    end
  end

  def logout
    session.clear
    redirect_to '/users/new'
  end


  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end

class RestaurantsController < ApplicationController
  def index
    @user = User.find(session[:id])
    @restaurants = Restaurant.all
  end

  def create
    puts params
    @restaurant = Restaurant.new(name:params[:name])
    if @restaurant.valid?
      @restaurant.save
      @user = User.find(session[:id])
      render partial: "restaurant_form"

    else
      flash[:errors] = @restaurant.errors.full_messages
    end
  end


  def update


  end
end

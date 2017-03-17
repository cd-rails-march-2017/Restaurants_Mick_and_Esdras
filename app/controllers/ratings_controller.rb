class RatingsController < ApplicationController
  def create
    restaurant = Restaurant.find(params[:restaurant])
    rating = Rating.new(user:User.find(params[:user]), restaurant:restaurant, rating:params[:rating])
    if rating.valid?
      rating.save
      restaurant.rating = Rating.where("restaurant_id = ?", restaurant.id).sum(:rating).to_f / restaurant.ratings.size.to_f
      restaurant.save
      render json: restaurant
    else
      puts "ERROR"
      flash[:errors] = restaurant.errors.full_messages
      redirect_to :back
    end
  end
end

class RatingsController < ApplicationController
  def create
    restaurant = Restaurant.find(params[:r_id])
    rating = Rating.new(user:User.find(params[:u_id]), restaurant:restaurant, rating:params[:rating])
    if rating.valid?
      rating.save
      restaurant.rating = Rating.where("restaurant_id = ?", restaurant.id).sum(:rating).to_f / restaurant.ratings.size.to_f
      restaurant.save
      redirect_to :back
    else
      flash[:errors] = restaurant.errors.full_messages
      redirect_to :back
    end
  end
end

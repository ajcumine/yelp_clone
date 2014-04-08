class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def create
    Restaurant.create(params[:restaurant].permit(:name, :category, :location))
    redirect_to '/restaurants'
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant].permit(:name, :category, :location))
    flash[:notice] = 'Restaurant updated successfully'
    redirect_to '/restaurants'
  end

  def destroy
  end
end

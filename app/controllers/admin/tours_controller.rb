class Admin::ToursController < ApplicationController

  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @tours = @genre.tours.order(created_at: :desc)
    else
      @tours = Tour.all
    end
  end

  def show
    @tour = Tour.find(params[:id])
    @tour_photos = @tour.tour_photos
    @reviews = @tour.reviews
  end

  def update
    @tour = Tour.find(params[:id])
    @tour.update(tour_params)
    redirect_to admin_tour_path(@tour)
  end

  private

  def tour_params
    params.require(:tour).permit(:is_active)
  end
end

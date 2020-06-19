class Admin::ToursController < ApplicationController
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
  end
end

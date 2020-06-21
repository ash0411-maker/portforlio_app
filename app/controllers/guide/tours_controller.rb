# frozen_string_literal: true

class Guide::ToursController < ApplicationController
  before_action :authenticate_guide!
  before_action :correct_guide, only: %i[new create edit update destroy]

  def show
    @tour = Tour.find(params[:id])
    @tour_photos = @tour.tour_photos
  end

  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @tours = @genre.tours.order(created_at: :desc).page(params[:page]).per(9)
    else
      @tours = Tour.all.order(created_at: :desc).page(params[:page]).per(9)
    end
  end

  def new
    @tour = Tour.new
    @tour_photo = @tour.tour_photos.build
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.guide_id = current_guide.id
    if @tour.save
      redirect_to guide_guide_tour_path(current_guide, @tour)
    else
      render 'new'
    end
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:id])
    if @tour.update(tour_params)
      redirect_to guide_guide_tour_path(current_guide, @tour)
    else
      render 'edit'
    end
  end

  def destroy; end


  private

  def tour_params
    params.require(:tour).permit(:genre_id, :city_id, :title, :body, :capacity, :time, :price,
                                 :contents_of_price, :meetingpoint_address, :meetingpoint_introduction, :is_active, tour_photos_attributes: %i[id image tour_id _destroy])
  end

  def correct_guide
    guide = Guide.find(params[:guide_id])
    redirect_to guide_guide_path(current_guide) if current_guide != guide
  end
end

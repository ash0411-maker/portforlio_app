# frozen_string_literal: true

class Guide::ToursController < ApplicationController
  before_action :authenticate_guide!

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

  def show; end

  def index; end

  def edit
    @tour = Tour.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:id])
    if @tour.update(tour_params)
      redirect_to guide_tour_path(@tour)
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
end

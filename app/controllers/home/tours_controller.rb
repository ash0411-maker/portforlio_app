# frozen_string_literal: true

class Home::ToursController < ApplicationController
  def index
    @tours = Tour.all.page(params[:page]).per(9)
  end

  def show
    @tour = Tour.find(params[:id])
    @tour_photos = @tour.tour_photos
    @reviews = @tour.reviews
  end
end

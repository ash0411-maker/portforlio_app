# frozen_string_literal: true

class Home::ToursController < ApplicationController
  def index
    @tours = Tour.where('is_active = ?', 1).page(params[:page]).per(9)
    @news = News.first(8)
  end

  def show
    @tour = Tour.find(params[:id])
    @tour_photos = @tour.tour_photos
    @reviews = @tour.reviews
  end
end

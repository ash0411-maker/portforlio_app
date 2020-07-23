# frozen_string_literal: true

class Tourist::ToursController < ApplicationController
  before_action :authenticate_tourist!, only: %i[show edit update destroy]
  before_action :correct_tourist, only: %i[show index]

  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @tours = @genre.tours.order(created_at: :desc).page(params[:page]).per(9)
    else
      @tours = Tour.where('is_active = ?', 1).page(params[:page]).per(9)
    end
  end

  def show
    @tour = Tour.find(params[:id])
    @tour_photos = @tour.tour_photos
    @reviews = @tour.reviews

    # チャット相手のidを入れる。
    rooms = current_tourist.rooms
    @guide_ids = []
    rooms.each do |room|
      @guide_ids << room.guide_id
    end
  end

  private

  def correct_tourist
    tourist = Tourist.find(params[:tourist_id])
    redirect_to edit_tourist_tourist_path(current_tourist) if current_tourist != tourist
  end
end

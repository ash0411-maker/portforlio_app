# frozen_string_literal: true

class Tourist::ToursController < ApplicationController
  before_action :authenticate_tourist!, only: %i[show edit update destroy]

  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @tours = @genre.tours.order(created_at: :desc).page(params[:page]).per(10)
    else
      @tours = Tour.all.page(params[:page]).per(9)
    end
  end

  def show
    @tour = Tour.find(params[:id])
    @tour_photos = @tour.tour_photos

    # チャット相手のidを入れる。
    rooms = current_tourist.rooms
    @guide_ids = []
    rooms.each do |room|
      @guide_ids << room.guide_id
    end
  end
end

class Tourist::BookMarksController < ApplicationController
  before_action :authenticate_tourist!
  before_action :correct_tourist, only: %i[create destroy index]

  def index
    @book_marks = current_tourist.book_marks
  end

  def create
    @tour = Tour.find(params[:tour_id])
    book_mark = current_tourist.book_marks.new(tour_id: @tour.id)
    book_mark.save
  end

  def destroy
    @tour = Tour.find(params[:tour_id])
    book_mark = current_tourist.book_marks.find_by(tour_id: @tour.id)
    book_mark.destroy
  end


  private

  def correct_tourist
    tourist = Tourist.find(params[:tourist_id])
    redirect_to tourist_tourist_path(current_tourist) if current_tourist != tourist
  end
end

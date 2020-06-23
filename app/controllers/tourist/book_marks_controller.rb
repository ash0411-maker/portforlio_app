class Tourist::BookMarksController < ApplicationController
  before_action :authenticate_tourist!
  before_action :correct_tourist, only: %i[create destroy index]

  def index
    @book_marks = current_tourist.book_marks
  end

  def create
    @tour = Tour.find(params[:tour_id])
    book_mark = current_tourist.book_marks.new(tour_id: @tour.id)
    if book_mark.save
       # -------- 通知機能　---------
       temp = Notification.where(['tourist_id = ? and guide_id = ? and tour_id = ? and action = ? ', current_tourist.id, @tour.guide.id, @tour.id, 'book_mark'])
       if temp.blank?
         notification = Notification.new(
           tour_id: @tour.id,
           tourist_id: current_tourist.id,
           guide_id: @tour.guide.id,
           action: 'book_mark'
         )
         notification.save
       end
    end
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

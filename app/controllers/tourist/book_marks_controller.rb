# frozen_string_literal: true

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
      notification = Notification.where(['tour_id = ? and action = ? ', @tour.id, 'book_mark'])
      notification_save(@tour.id, current_tourist.id, @tour.guide.id, book_mark) if notification.blank?
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
    redirect_to edit_tourist_tourist_path(current_tourist) if current_tourist != tourist
  end

  def notification_save(tour_id, tourist_id, guide_id, _action)
    notification = Notification.new(
      tour_id: tour_id,
      tourist_id: tourist_id,
      guide_id: guide_id,
      action: 'book_mark'
    )
    notification.save
  end
end

# frozen_string_literal: true

class Tourist::ReviewsController < ApplicationController
  before_action :authenticate_tourist!
  before_action :correct_tourist, only: %i[create update]

  def create
    @tour = Tour.find(params[:tour_id])
    review = current_tourist.reviews.new(review_params)
    review.tour_id = @tour.id
    if review.save
      order = Order.find(params[:order_id])
      order.update(status: 'レビュー済み')
      # -------- 通知機能（レビューコメント）--------
      save_review_notification(review.id, @tour.guide.id, @tour.id)
      # -------- 通知機能（レビューコメント）--------
      redirect_to tourist_tourist_tour_path(current_tourist, @tour)
    else
      flash[:notice] = 'レビューコメントを正しく入力してください'
      order = Order.find(params[:order_id])
      redirect_to tourist_tourist_order_path(current_tourist, order.id)
    end
  end

  def update
    review = Review.find(params[:review_id])
    order = Order.find(params[:order_id])
    tour = Tour.find(params[:tour_id])
    if review.update(review_params)
      redirect_to tourist_tourist_tour_path(current_tourist, tour)
    else
      flash[:notice] = 'レビューコメントを正しく入力してください'
      redirect_to tourist_tourist_order_path(current_tourist, order.id)
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end

  def correct_tourist
    tourist = Tourist.find(params[:tourist_id])
    redirect_to eidt_tourist_tourist_path(current_tourist) if current_tourist != tourist
  end

  # -------- 通知機能（レビューコメント）--------
  def save_review_notification(review_id, guide_id, tour_id)
    notification = current_tourist.notifications.new(
      tour_id: tour_id,
      guide_id: guide_id,
      review_id: review_id,
      tourist_id: current_tourist,
      action: 'comment'
    )
    notification.save if notification.valid?
  end
end

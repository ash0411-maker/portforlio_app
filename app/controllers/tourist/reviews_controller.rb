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
      redirect_to tourist_tourist_tour_path(current_tourist, @tour)
    else
      flash[:notice] = 'レビューコメントを入力してください'
      redirect_to tourist_tourist_path(current_tourist)
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to tourist_tourist_tour_path(current_tourist, @tour)
    else
      flash[:notice] = 'レビューコメントを入力してください'
      render 'edit'
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end

  def correct_tourist
    tourist = Tourist.find(params[:tourist_id])
    redirect_to tourist_tourist_path(current_tourist) if current_tourist != tourist
  end
end

# frozen_string_literal: true

class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    review = Review.find(params[:id])
    tour = review.tour
    review.destroy
    redirect_to admin_tour_path(tour)
  end
end

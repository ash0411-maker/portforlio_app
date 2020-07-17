# frozen_string_literal: true

class Guide::HomeController < ApplicationController
  before_action :authenticate_guide!
  before_action :correct_guide, only: %i[new create edit update destroy]

  def top
    @orders = current_guide.orders.where(created_at: Time.zone.now.all_day)
  end

  private

  def correct_guide
    guide = Guide.find(params[:guide_id])
    redirect_to guide_guide_path(current_guide) if current_guide != guide
  end
end

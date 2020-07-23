# frozen_string_literal: true

class Tourist::ChatNoticesController < ApplicationController
  before_action :authenticate_tourist!
  before_action :correct_tourist, only: [:index]

  def index
    @chat_notices = current_tourist.tourist_passive_notices.joins(:chat).where('chats.is_tourist = ?', 0).page(params[:page]).per(20)
  end

  private

  def correct_tourist
    tourist = Tourist.find(params[:tourist_id])
    redirect_to edit_tourist_tourist_path(current_tourist) if current_tourist != tourist
  end
end

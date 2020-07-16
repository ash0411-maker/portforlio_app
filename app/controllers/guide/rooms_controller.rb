# frozen_string_literal: true

class Guide::RoomsController < ApplicationController
  before_action :authenticate_guide!
  before_action :correct_guide, only: %i[show index create]

  def index
    @rooms = current_guide.rooms.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @room = Room.find(params[:id])
    @chat = Chat.new
    @chats = @room.chats
    # ------ チャット通知機能 -----
    @chats.each do |chat|
      next if chat.is_tourist == false

      chat.chat_notices.each do |chat_notice|
        chat_notice.update_attributes(checked: true)
      end
    end
    if @room.guide.id == current_guide.id
      @tourist = @room.tourist
    else
      redirect_to root_path
    end
  end

  def create
    @room = Room.new(room_tourist_params)
    @room.guide_id = current_guide.id
    if @room.save
      redirect_to guide_guide_room_path(current_guide, @room)
    else
      redirect_to guide_guide_orders_path(current_guide)
    end
  end

  private

  def room_tourist_params
    params.require(:room).permit(:tourist_id)
  end

  def correct_guide
    guide = Guide.find(params[:guide_id])
    redirect_to guide_guide_path(current_guide) if current_guide != guide
  end
end

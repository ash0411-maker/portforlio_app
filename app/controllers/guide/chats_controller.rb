class Guide::ChatsController < ApplicationController
    before_action :authenticate_guide!, only: [:create]
  before_action :correct_guide, only: [:create]

  def create
    @room = Room.find(params[:room_id])
    @chat = Chat.new(chat_params)
    # メッセージがguideによるものだったらis_tourist = false
    @chat.is_tourist = false
    @chat.room_id = @room.id
    if @chat.save
      save_chat_notice!(@chat.id, @room.tourist.id)
      redirect_to guide_guide_room_path(current_guide, @room)
    else
      flash[:warning] = 'メッセージを入力してください'
      redirect_to guide_guide_room_path(current_guide, @room)
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end

  def correct_guide
    guide = Guide.find(params[:guide_id])
    redirect_to guide_guide_path(current_guide) if current_guide != guide
  end

  def save_chat_notice!(chat_id, tourist_id)
    chat_notice = current_guide.guide_active_notices.new(
      visitor_id: current_guide.id,
      visited_id: tourist_id,
      chat_id: chat_id
    )
    chat_notice.save if chat_notice.valid?
  end
end

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
end

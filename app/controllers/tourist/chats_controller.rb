class Tourist::ChatsController < ApplicationController
  before_action :correct_tourist, only: [:create]
  before_action :authenticate_tourist!

  def create
    @room = Room.find(params[:room_id])
    @chat = Chat.new(chat_params)
    # メッセージがtouristによるものだったらis_tourist = true, guideによるものだったらis_tourist = false
    @chat.is_tourist = true
    @chat.room_id = @room.id
    if @chat.save
        redirect_to tourist_tourist_room_path(current_tourist, @room)
    else
        flash[:warning] = 'メッセージを入力してください'
        redirect_to tourist_tourist_room_path(current_tourist, @room)
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end

  def correct_tourist
    tourist = Tourist.find(params[:tourist_id])
    redirect_to tourist_tourist_path(current_tourist) if current_tourist != tourist
  end

end

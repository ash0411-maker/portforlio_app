class Tourist::RoomsController < ApplicationController
  before_action :authenticate_tourist!
  before_action :correct_tourist, only: %i[index show create destroy]

  def index
    @rooms = current_tourist.rooms.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @room = Room.find(params[:id])
    @chat = Chat.new
    @chats = @room.chats
    # ------ チャット通知機能 -----
    @chats.each do |chat|
      next unless chat.is_tourist == false

      chat.chat_notices.each do |chat_notice|
        chat_notice.update(checked: true)
      end
    end
    @guide = @room.guide.name
  end

  def create
    @room = Room.new(room_guide_params)
    @room.tourist_id = current_tourist.id
    if @room.save
      redirect_to tourist_tourist_room_path(current_tourist, @room)
    else
      redirect_to tourist_tourist_path(current_tourist)
    end
  end

  private

  def room_guide_params
    params.require(:room).permit(:guide_id)
  end

  def correct_tourist
    tourist = Tourist.find(params[:tourist_id])
    redirect_to tourist_tourist_path(current_tourist) if current_tourist != tourist
  end
end

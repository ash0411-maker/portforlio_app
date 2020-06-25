class Admin::RoomsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages # このルームのメッセージを全て取得
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = 'チャットルームを削除しました。'
    redirect_to admin_rooms_path
  end
end

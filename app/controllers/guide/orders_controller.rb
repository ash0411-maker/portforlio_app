# frozen_string_literal: true

class Guide::OrdersController < ApplicationController
  before_action :authenticate_guide!
  before_action :correct_guide, only: %i[index show update]

  def index
    @orders = current_guide.orders
    guide_total_sales = []
    @orders.each do |order|
      guide_total_sales << order.guide_sales
    end
    guide_total_sales_sum = guide_total_sales.sum
    @guide_total_sales = guide_total_sales_sum.floor

    # ステータス毎に画面切替
    order_status_params(params[:order_status])

    # チャット相手のidを入れる。
    rooms = current_guide.rooms
    @tourist_ids = []
    rooms.each do |room|
      @tourist_ids << room.tourist_id
    end
  end

  def show
    @order = Order.find(params[:id])
    @tour = Tour.find_by(id: @order.tour_id)
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = '予約ステータスを更新しました'
      redirect_to guide_guide_orders_path(current_guide, order_status: "just_in_orders")
    end
  end


  private

  def order_params
    params.require(:order).permit(:status)
  end

  def correct_guide
    guide = Guide.find(params[:guide_id])
    redirect_to guide_guide_path(current_guide) if current_guide != guide
  end

  def order_status_params(order_status_params)
    if order_status_params == "just_in_orders"
      @order_status = "just_in_orders"
      @just_in_orders = current_guide.orders.where(created_at: Time.zone.now.all_day)
    elsif order_status_params == "current_orders"
      @order_status = "current_orders"
      @current_orders = current_guide.orders.where(status: "ツアー開始前")
    elsif order_status_params == "day_before_orders"
      @order_status = "day_before_orders"
      @day_before_orders = current_guide.orders.where(status: "ツアー前日")
    elsif  order_status_params == "the_day_orders"
      @order_status = "the_day_orders"
      @the_day_orders = current_guide.orders.where(status: "ツアー当日")
    elsif  order_status_params == "finished_orders"
      @order_status = "finished_orders"
      @finished_orders = current_guide.orders.where(status: "ツアー終了")
      @reviewed_orders = current_guide.orders.where(status: "レビュー済み")
    end
  end
end

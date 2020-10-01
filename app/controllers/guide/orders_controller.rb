# frozen_string_literal: true

class Guide::OrdersController < ApplicationController
  before_action :authenticate_guide!
  before_action :set_order, only: %i[show update]
  before_action :correct_guide, only: %i[index show update]

  def index
    @orders = current_guide.orders
    guide_total_sales = @orders.map{|order| order.guide_sales}
    guide_total_sales_sum = guide_total_sales.sum
    @guide_total_sales = guide_total_sales_sum.floor

    # ステータス毎に画面切替
    get_order_status(params[:order_status])

    # チャット相手のidを入れる。
    rooms = current_guide.rooms
    @tourist_ids = rooms.map{|room|room.tourist_id}
  end

  def show
    @tour = Tour.find_by(id: @order.tour_id)
  end

  def update
    if @order.update(order_params)
      flash[:notice] = '予約ステータスを更新しました'
      redirect_to guide_guide_orders_path(current_guide, order_status: 'just_in_orders')
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def correct_guide
    guide = Guide.find(params[:guide_id])
    redirect_to guide_guide_path(current_guide) if current_guide != guide
  end

  def get_order_status(order_status)
    @order_status = order_status
    case @order_status
    when 'just_in_orders'
      @just_in_orders = current_guide.orders.where(created_at: Time.zone.now.all_day)
    when 'current_orders'
      @current_orders = current_guide.orders.where(status: 'ツアー開始前')
    when 'day_before_orders'
      @day_before_orders = current_guide.orders.where(status: 'ツアー前日')
    when 'the_day_orders'
      @the_day_orders = current_guide.orders.where(status: 'ツアー当日')
    when 'finished_orders'
      @finished_orders = current_guide.orders.where(status: 'ツアー終了')
      @reviewed_orders = current_guide.orders.where(status: 'レビュー済み')
    end
  end
end

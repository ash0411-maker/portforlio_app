class Guide::OrdersController < ApplicationController
  
  before_action :authenticate_guide!
  before_action :correct_guide, only: %i[index update new_order day_before_touring finished_tour]

  def index
    @orders = current_guide.orders
    @todays_orders = current_guide.orders.where(created_at: Time.zone.now.all_day)
    guide_total_sales = []
    @orders.each do |order|
      guide_total_sales << order.guide_sales
    end
    guide_total_sales_sum = guide_total_sales.sum
    @guide_total_sales = guide_total_sales_sum.floor

    # チャット相手のidを入れる。
    rooms = current_guide.rooms
    @tourist_ids = []
    rooms.each do |room|
      @tourist_ids << room.tourist_id
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = '予約ステータスを更新しました'
      redirect_to guide_guide_orders_path(current_guide)
    end
  end


  # -------------- 予約ステータス変更ページ --------------
  def new_order
    @orders = current_guide.orders
    guide_total_sales = []
    @orders.each do |order|
      guide_total_sales << order.guide_sales
    end
    guide_total_sales_sum = guide_total_sales.sum
    @guide_total_sales = guide_total_sales_sum.floor
  end


  def day_before_touring
    @orders = current_guide.orders
    guide_total_sales = []
    @orders.each do |order|
      guide_total_sales << order.guide_sales
    end
    guide_total_sales_sum = guide_total_sales.sum
    @guide_total_sales = guide_total_sales_sum.floor
  end


  def finished_tour
    @orders = current_guide.orders
    guide_total_sales = []
    @orders.each do |order|
      guide_total_sales << order.guide_sales
    end
    guide_total_sales_sum = guide_total_sales.sum
    @guide_total_sales = guide_total_sales_sum.floor
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

  def correct_guide
    guide = Guide.find(params[:guide_id])
    redirect_to guide_guide_path(current_guide) if current_guide != guide
  end
end

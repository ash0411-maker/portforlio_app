class Tourist::OrdersController < ApplicationController

  before_action :authenticate_tourist!
  before_action :correct_tourist, only: %i[new confirm create destroy index]

  def index
  end

  def new
    @tour = Tour.find_by(id: params[:tour_id])
    @tourist = Tourist.find_by(id: params[:tourist_id])
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if @order.total_people.nil?
      flash[:danger] = '参加人数を入力してください。'
      redirect_to new_tourist_tourist_order_path(current_tourist, tour_id: @order.tour_id)
    elsif @order.total_people.to_i > @order.tour_capacity.to_i
      flash[:danger] = '定員数を超えています。'
      redirect_to new_tourist_tourist_order_path(current_tourist, tour_id: @order.tour_id)
    elsif !@order.total_people.nil?
      @total_price = @order.tour_price * @order.total_people
    end
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to tourist_orders_thanks_path
  end

  def thanks; end


  private

  def order_params
    params.require(:order).permit(:tour_date, :tourist_id, :tour_id, :guide_id, :tour_title, :tour_body, :tour_price, :tour_contents_of_price, :tour_capacity, :total_people, :total_price, :tour_time, :tour_city, :admin_sales, :guide_sales, :tour_genre, :tour_price)
  end

  def correct_tourist
    tourist = Tourist.find(params[:tourist_id])
    redirect_to tourist_tourist_path(current_tourist) if current_tourist != tourist
  end
end

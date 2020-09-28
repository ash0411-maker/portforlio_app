# frozen_string_literal: true

class Admin::HomeController < ApplicationController
  def top
    @day_of_orders = Order.where(created_at: Time.zone.now.all_day)
    @day_of_orders_count = @day_of_orders.count
    day_of_total_sales = []
    @day_of_orders.each do |order|
      day_of_total_sales << order.admin_sales
    end
    @day_of_total_sales = day_of_total_sales.sum

    orders = Order.all
    total_sales = []
    orders.each do |order|
      total_sales << order.admin_sales
    end
    @total_sales = total_sales.sum
  end
end

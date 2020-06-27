class Admin::SearchesController < ApplicationController
    def order
        if @order_id = params['search']['order_id']
            @order = Order.match(@order_id)
            @order = if @order.nil?
                    0
                else
                    Order.find(@order.id)
                end
        end
    end

    def tourist
        if @toursit_id = params['search']['tourist_id']
            @tourist = Order.match(@toursit_id)
            @tourist = if @tourist.nil?
                    0
                else
                    Order.find(@order.id)
                end
        end
    end

    def order
        if @guide_id = params['search']['guide_id']
            @guide = Guide.match(@guide_id)
            @guide = if @tourist.nil?
                    0
                else
                    Guide.find(@tourist.id)
                end
        end
    end
end

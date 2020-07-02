class Admin::SearchesController < ApplicationController
    before_action :authenticate_admin!

    def result
        @content = params["search"]["content"]
        @model = params["search"]["model"]
        @order = Order.match(@model, @content)
        @guide = Guide.match(@model, @content)
        if @tourist = Tourist.match(@model, @content)
            @orders = @tourist.orders
        end
    end
end

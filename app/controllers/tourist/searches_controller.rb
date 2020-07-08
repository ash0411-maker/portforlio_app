# frozen_string_literal: true

class Tourist::SearchesController < ApplicationController
  before_action :authenticate_tourist!

  def city
    if @city = params['search']['city']
      city_search_result = City.match(@city)
      if city_search_result.nil?
        @city_tours = nil
        @genres = Genre.all
      else
        @city_tours = city_search_result.tours.page(params[:page]).per(9)
        @genres = Genre.all
      end
    end
  end
end

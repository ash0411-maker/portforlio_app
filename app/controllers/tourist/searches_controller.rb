class Tourist::SearchesController < ApplicationController
  before_action :authenticate_tourist!

  def city
    if @city = params['search']['city']
      city_search_result = City.match(@city)
      if city_search_result.empty?
        @city_tours = empty
      else
        @city_tours = city.tours.page(params[:page]).per(9)
        @genres = Genre.all
      end
    end
  end
end

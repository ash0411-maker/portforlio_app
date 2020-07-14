class Tourist::SearchesController < ApplicationController
  before_action :authenticate_tourist!

  def city
    if @city = params['search']['city']
      city_search_result = City.match(@city)
      if @city == ""
        @city_tours = Tour.all.page(params[:page]).per(9)
        @genres = Genre.all
        flash[:notice] = "都市名を入力してください"
      elsif city_search_result.nil?
        @city_tours = nil
        @genres = Genre.all
        @cities = City.all
        flash[:notice] = ""
      else
        @city_tours = city_search_result.tours.page(params[:page]).per(9)
        @genres = Genre.all
        flash[:notice] = ""
      end
    end
  end
end

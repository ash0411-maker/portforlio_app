# frozen_string_literal: true

class Admin::CitiesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @city = City.new
    @cities = City.all
  end

  def create
    @city = City.new(city_params)
    if @city.save
      flash[:notice] = '新たな都市を追加しました。'
      redirect_to admin_cities_path
    else
      @cities = City.all
      render 'index'
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    if @city.update(city_params)
      flash[:notice] = '都市名を編集しました。'
      redirect_to admin_cities_path
    else
      render 'edit'
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    flash[:notice] = '都市を削除しました。'
    redirect_to admin_cities_path
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end
end

class Tourist::TouristsController < ApplicationController

  before_action :authenticate_tourist!, only: %i[show edit update destroy]
  before_action :correct_tourist, only: %i[show edit update destroy]

  def show
  end

  def edit
    @tourist = Tourist.find(params[:id])
  end

  def update
    @tourist = Tourist.find(params[:id])
    if @tourist.update(tourist_params)
      redirect_to tourist_tourist_path(@tourist)
      flash[:notice] = '個人情報を更新しました。'
    else
      render 'edit'
    end
  end

  private

  def tourist_params
    params.require(:tourist).permit(:family_name, :name, :nationality, :birth_year, :address, :postal_code, :email, :phone_number, :sex)
  end

  def correct_tourist
    tourist = Tourist.find(params[:id])
    redirect_to tourist_tourist_path(current_tourist) if current_tourist != tourist
  end
end

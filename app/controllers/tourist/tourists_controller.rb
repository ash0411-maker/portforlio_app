# frozen_string_literal: true

class Tourist::TouristsController < ApplicationController
  before_action :set_tourist, only: %i[edit update destroy]
  before_action :authenticate_tourist!, only: %i[edit update destroy]
  before_action :correct_tourist, only: %i[edit update destroy]

  def edit; end

  def update
    if @tourist.update(tourist_params)
      redirect_to edit_tourist_tourist_path(@tourist)
      flash[:notice] = '個人情報を更新しました。'
    else
      render 'edit'
    end
  end

  def destroy
    if @tourist.id == 1
      redirect_to tourist_tourist_cannot_tourist_delete_path(current_tourist)
    else
      @tourist.destroy
      redirect_to tourist_tourist_thanks_path
    end
  end

  def delete; end

  private

  def tourist_params
    params.require(:tourist).permit(:family_name, :name, :nationality, :birth_year, :address, :postal_code, :email, :phone_number, :sex)
  end

  def set_tourist
    @tourist = Tourist.find(params[:id])
  end

  def correct_tourist
    tourist = Tourist.find(params[:id])
    redirect_to edit_tourist_tourist_path(current_tourist) if current_tourist != tourist
  end
end

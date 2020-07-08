# frozen_string_literal: true

class Admin::TouristsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @tourists = Tourist.all.with_deleted
  end

  def show
    @tourist = Tourist.with_deleted.find(params[:id])
    @orders = @tourist.orders
  end

  def update
    @tourist = Tourist.with_deleted.find(params[:id])
    if @tourist.id == 1
      flash[:notice] = 'ゲストユーザーは変更できません。'
      redirect_to admin_tourist_path(@tourist)
    elsif if @tourist.update(tourist_params)
            if tourist_params[:deleted_at].to_i == 0
              flash[:notice] = '会員を再開させました'
              @tourist.restore
              redirect_to admin_tourist_path(@tourist)
            else
              flash[:notice] = '退会させました'
              @tourist.destroy
              redirect_to admin_tourist_path(@tourist)
            end
          else
            flash[:notice] = '情報の更新に失敗しました'
            render 'edit'
      end
    end
  end

  private

  def tourist_params
    params.require(:tourist).permit(:deleted_at)
  end
end

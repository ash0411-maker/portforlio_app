# frozen_string_literal: true

class Admin::GuidesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @guides = Guide.all.with_deleted
  end

  def show
    @guide = Guide.with_deleted.find(params[:id])
  end

  def update
    @guide = Guide.with_deleted.find(params[:id])
    if @guide.id == 1
      flash[:notice] = 'ゲストユーザーは変更できません。'
      redirect_to admin_guide_path(@guide)
    else
      if guide_params
        if guide_params[:deleted_at].to_i == 0
          @guide.restore
          flash[:notice] = '会員を再開させました'
          redirect_to admin_guide_path(@guide)
        elsif guide_params[:deleted_at].to_i == 1
          @guide.destroy
          flash[:notice] = '退会させました'
          redirect_to admin_guide_path(@guide)
        end
      else
        flash[:notice] = '情報の更新に失敗しました'
        render 'show'
      end
  end

  private

  def guide_params
    params.require(:guide).permit(:deleted_at)
  end
end

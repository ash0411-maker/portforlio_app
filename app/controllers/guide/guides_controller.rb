# frozen_string_literal: true

class Guide::GuidesController < ApplicationController
  before_action :authenticate_guide!, only: %i[show edit update destroy]
  before_action :correct_guide, only: %i[show edit update destroy]
  before_action :set_guide, only: %i[show edit update destroy]

  def show
    @tours = @guide.tours
  end

  def update
    if @guide.update(guide_params)
      redirect_to guide_guide_path(@guide)
    else
      render 'edit'
    end
  end

  def destroy
    if @guide.id == 1
      redirect_to guide_guide_cannot_guide_delete_path(current_guide)
    else
      @guide.destroy
      redirect_to guide_thanks_path
    end
  end

  def edit; end

  def to_guide_edit; end

  def delete; end

  def cannot_delete; end

  def thanks; end

  private

  def guide_params
    params.require(:guide).permit(:family_name, :name, :address, :postal_code, :email, :phone_number, :identification_image, :selfy_image, :introduction_image, :introduction, :nationality)
  end

  def correct_guide
    guide = Guide.find(params[:id])
    redirect_to guide_guide_path(current_guide) if current_guide != guide
  end

  def set_guide
    @guide = Guide.find(params[:id])
  end
end

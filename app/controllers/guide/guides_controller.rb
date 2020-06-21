class Guide::GuidesController < ApplicationController

  before_action :authenticate_guide!, only: %i[show edit update destroy]
  before_action :correct_guide, only: %i[show edit update destroy]


  def show
    @guide = Guide.find(params[:id])
    @tours = @guide.tours
  end

  def edit
    @guide = Guide.find(params[:id])
  end

def update
  @guide = Guide.find(params[:id])
  if @guide.update(guide_params)
    redirect_to guide_guide_path(@guide)
  else
    render 'edit'
  end
end


  private

  def guide_params
    params.require(:guide).permit(:family_name, :name, :address, :postal_code, :email, :phone_number, :identification_image, :selfy_image, :introduction_image, :introduction, :nationality)
  end

  def correct_guide
    guide = Guide.find(params[:id])
    redirect_to guide_guide_path(current_guide) if current_guide != guide
  end
end

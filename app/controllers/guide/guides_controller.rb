class Guide::GuidesController < ApplicationController

  before_action :authenticate_guide!, only: %i[show edit update destroy]
  before_action :correct_guide, only: %i[show edit update destroy]


  def show
    @guide = Guide.find(params[:id])
    @tours = @guide.tours
  end

  def edit
  end


  private

  def correct_guide
    guide = Guide.find(params[:id])
    redirect_to guide_guide_path(current_guide) if current_guide != guide
  end
end

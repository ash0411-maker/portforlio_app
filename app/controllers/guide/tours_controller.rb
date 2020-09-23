# frozen_string_literal: true

class Guide::ToursController < ApplicationController
  before_action :authenticate_guide!
  before_action :set_tour, only: %i[show edit update destroy]
  before_action :correct_guide, only: %i[index show new create edit update destroy]

  def show
    @tour_photos = @tour.tour_photos
    @reviews = @tour.reviews
    @book_marks = @tour.book_marks
  end

  def index
    @genres = Genre.all
    @news = News.first(7)
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @tours = @genre.tours.order(created_at: :desc).page(params[:page]).per(9)
    else
      @tours = Tour.all.order(created_at: :desc).page(params[:page]).per(9)
    end
  end

  def new
    # 個人情報に入力漏れがある場合はツアーを投稿させない
    if current_guide.family_name.blank? || current_guide.name.blank? || current_guide.nationality.blank? ||
       current_guide.identification_image_id.blank? || current_guide.postal_code.blank? || current_guide.address.blank? ||
       current_guide.phone_number.blank? || current_guide.introduction.blank? || current_guide.selfy_image_id.blank?
      redirect_to guide_guide_to_guide_edit_path(current_guide)
    end
    @tour = Tour.new
    @tour_photo = @tour.tour_photos.build
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.guide_id = current_guide.id
    if @tour.save
      news_create(@tour.id, @tour.guide.id, 'create')
      redirect_to guide_guide_tour_path(current_guide, @tour)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @tour.update(tour_params)
      news_create(@tour.id, @tour.guide.id, 'update')
      redirect_to guide_guide_tour_path(current_guide, @tour)
    else
      render 'edit'
    end
  end

  def destroy
    @tour.destroy
    flash[:notice] = 'ツアーを削除しました。'
    redirect_to guide_guide_path(current_guide)
  end

  private

  def tour_params
    params.require(:tour).permit(:genre_id, :city_id, :title, :body, :capacity, :time, :price,
                                 :contents_of_price, :meetingpoint_address, :meetingpoint_introduction, :is_active, tour_photos_attributes: %i[id image tour_id _destroy])
  end

  def news_create(tour_id, guide_id, action)
    News.create(
      tour_id: tour_id,
      guide_id: guide_id,
      action: action
    )
  end

  def correct_guide
    guide = Guide.find(params[:guide_id])
    redirect_to guide_guide_path(current_guide) if current_guide != guide
  end

  def set_tour
    @tour = Tour.find(params[:id])
  end
end

class PicturesController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      flash[:success] = 'Picture downloaded!'
      redirect_to pictures_path
    else
      @picture.valid?
      flash[:danger] = 'SMTH wrong!'
      redirect_to user_path(current_user)
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :img, :category_id)
  end


end



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

  def like
    @picture = Picture.find(params[:picture_id])
    curr_like = @picture.likes.find_by(user_id: current_user.id)
    if curr_like
      curr_like.destroy
    else
      @picture.likes.create(user_id: current_user.id)
    end
    redirect_back(fallback_location: @picture)
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :img, :category_id)
  end


end



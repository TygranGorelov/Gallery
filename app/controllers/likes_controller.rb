class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_picture

  def create
    @picture.likes.create(user_id: current_user.id)
    redirect_back(fallback_location: @picture)
  end

  def destroy
    like = @picture.likes.find_by(user_id: current_user.id)
    like.destroy
    redirect_back(fallback_location: @picture)
  end

  private

  def set_picture
    @picture = Picture.find(params[:picture_id])
  end
end
class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_picture

  # def create
  #   if @picture.likes.create(user: current_user)
  #     flash[:success] = 'Like added!'
  #     redirect_back(fallback_location: @picture)
  #   else
  #     flash[:danger] = 'SMTH wrong!'
  #     redirect_to user_path(current_user)
  #   end
  # end
  #
  # def destroy
  #   like = @picture.likes.find(params[:id])
  #   if like.user == current_user
  #     like.destroy
  #     flash[:success] = 'Like deleted'
  #     redirect_back(fallback_location: @picture)
  #   end
  # end
  
  
  # def like
  #   curr_like = @picture.likes.find_by(user_id: params[:user_id])
  #   if curr_like
  #     curr_like.destroy
  #   else
  #     @picture.likes.create(user_id: params[:user_id])
  #   end
  # end

  private

  def set_picture
    @picture = Picture.find(params[:picture_id])
  end
end
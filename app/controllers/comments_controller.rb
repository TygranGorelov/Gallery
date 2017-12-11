class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    if comment.save
      flash[:success] = 'Comment printed!'
      redirect_back(fallback_location: comment.picture)
    else
      flash[:danger] = 'SMTH wrong!'
      redirect_to user_path(current_user)
    end
  end

  def index
    @comments = Comment.all
    # @picture = Picture.find(params[:id])
    @user_pictures = Picture.joins(category: :user).where('categories.user_id = :user_id', user_id: current_user.id)
    @user = User.all
  end

  def show; end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user == current_user || current_user.admin?
    flash[:success] = 'Comment deleted'
    redirect_back(fallback_location: comment.picture)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :picture_id)
  end

end
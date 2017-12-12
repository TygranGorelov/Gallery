class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :correct_user, only: :destroy


  def create
    @category = Category.new(category_params)
    if current_user != @category.user && !current_user.admin?
      @category.user = current_user
    end
    if @category.save
      flash[:success] = 'Category created!'
      redirect_to user_path(current_user)
    else
      flash[:danger] = 'SMTH wrong!'
    end
  end

  def destroy
    @category = current_user.categories.find_by(id: params[:id])
    @category.destroy
    flash[:success] = 'Category deleted'
    redirect_to user_path(current_user)
  end

  def show
    @category = Category.find(params[:id])
    @pictures = @category.pictures
  end

  def index
    @categories = Category.all
  end


  def subscribe
    @category = Category.find(params[:category_id])
    current_user.followed_categories << @category
    redirect_back(fallback_location: @category)
  end

  def unsubscribe
    @category = Category.find(params[:category_id])
    current_user.followed_categories.delete(@category)
    redirect_back(fallback_location: @category)
  end

  private

  def category_params
    params.require(:category).permit(:content, :user_id)
  end

  def correct_user
    @category = current_user.categories.find_by(id: params[:id])
    flash[:danger] = 'SMTH wrong!' if @category.nil?
    # redirect_to root_url if @category.nil?
  end

end
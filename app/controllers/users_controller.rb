# frozen_string_literal: true

class UsersController < ApplicationController

  before_action :authenticate_user!

  def my_page
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    # @user = User.find(params[:id])
  end

  def show
    @picture = Picture.new
    @user = User.find(params[:id])
    @categories = @user.categories.order(:created_at).page(params[:page])
  end

  
  private



end
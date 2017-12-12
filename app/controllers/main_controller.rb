# frozen_string_literal: true

class MainController < ApplicationController
  def index
  
    # @user = User.find(params[:id])
    # @categories = @user.categories.order(:created_at).page(params[:page])

    @categories = current_user.categories.order(:created_at).page(params[:page])


  end
end

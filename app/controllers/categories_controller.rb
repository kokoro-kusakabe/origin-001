class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @tweets = @category.tweets
  end
  
end

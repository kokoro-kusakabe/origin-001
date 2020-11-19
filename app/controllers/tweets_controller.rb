class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.limit(3).all.sort { |a, b| b.liked_users.count <=> a.liked_users.count }
    @tweet = Tweet.all.limit(6).order("created_at DESC")
    @categories = Category.all
  end

  def new
    @tweet = Tweet.new
    @categories = Category.all
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @like = Like.new
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
    @categories = Category.all
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :text, :image, category_ids: []).merge(user_id: current_user.id)
  end
end

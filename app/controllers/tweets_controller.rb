class TweetsController < ApplicationController

# before_action :move_to_index,except: [:index,:show]
before_action :set_tweet,only:[:destroy,:edit,:update,:show]

  def index
    @tweets=Tweet.includes(:user).page(params[:page]).per(5).order("created_at desc")
  end

  def new
  end

  def create
    @tweet = Tweet.create(tweet_params)
  end

  def destroy
    @tweet.destroy if @tweet.user_id == current_user.id
  end

  def edit
  end

  def update
    @tweet.update(tweet_params) if @tweet.user_id == current_user.id

  end

  def show
    @tweet=Tweet.find(params[:id])
    @comments=@tweet.comments.includes(:user)
  end





  private
  def tweet_params
    params.permit(:image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end





end


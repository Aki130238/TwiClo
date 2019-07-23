class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    redirect_to tweets_path
  end

  def show
    @favorite = current_user.favorites.find_by(tweet_id: @tweet.id)
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "ツイートを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice:"ツイートを削除しました！"
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    render :new if @tweet.invalid?
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end

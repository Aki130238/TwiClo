class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
    @users = User.all
    @user = current_user
    binding.pry
  end

  def new
    if params[:back]
      @tweet = Tweet.new(tweet_params)
    else
      @tweet = Tweet.new
    end
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "ツイートしました"
    else
      render 'new'
    end
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
    @tweet = current_user.tweets.build(tweet_params)
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

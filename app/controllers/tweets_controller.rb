class TweetsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]  #유저가 로그인 되어있는지 확인해라
before_action :set_tweet, only: [:show, :edit, :update, :destroy ]
#모든 함수가 실행되기 이전에

  def index
    @tweets = Tweet.order(:id => :desc).page(params[:page])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    redirect_to '/'
  end

  def show
    # 1개의 트윗만 보여줌

  end

  def edit

    # 수정할 트윗 수정하는 form
  end

  def update
    # 실제로 수정

    @tweet.update(tweet_params())
    redirect_to tweet_path(@tweet)
  end

  def destroy
    # 지우는 것

    @tweet.destroy

    redirect_to tweets_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :content, :user_id, :photo_url)
  end

  def set_tweet
    @tweet =Tweet.find(params[:id])
  end



end

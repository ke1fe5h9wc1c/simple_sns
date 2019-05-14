class TweetsController < ApplicationController

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to controller: 'users', action: 'index'
    else
      # メッセージの保存に失敗した場合
      redirect_to :root, alert: 'メッセージの送信に失敗しました'
    end
  end
 
    private
      def tweet_params
          params.require(:tweet).permit(:comment, :user_id, :name)
      end
end
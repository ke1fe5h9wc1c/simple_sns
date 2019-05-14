class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @tweet = Tweet.new
    # フォロー中のユーザを取得
    follower = Relationship.where(user_id: current_user.id).pluck(:follow_id)
    # 現在のユーザーとフォロー中のユーザの投稿を取得
    @tweets = Tweet.where(user_id: current_user.id).or(Tweet.where(user_id: follower))
    # サイドバーで使用する現在のユーザーの情報を取得
    @user = { "name" => current_user.name , "Tweet" =>  Tweet.where(user_id: current_user.id), "Follow" => Relationship.where(user_id: current_user.id).pluck(:follow_id), "Follower" => Relationship.where(follow_id: current_user.id)} 
    # サイドバーで使用する現在のユーザー以外の情報を取得
    @other_user = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @show_tweets = Tweet.where(user_id: @user.id)
    @show_follow = User.where.not(id: current_user.id)
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
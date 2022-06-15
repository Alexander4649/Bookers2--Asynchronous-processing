class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
    #@users = User.where.not(id:cuurent_user.id)
  end
  
  #あるユーザーがフォローしている人全員を取得するアクションが必要
  def followings
    # あるユーザーに結びついている(ユーザーがフォローしている)人の情報を全て取得する
    # user.rbにてfollowingsの定義をしている為、使用できる記述
    @user = User.find(params[:id])
    @users = User.followings
    
    # user = User.find(params[:user_id])
    # @users = user.followings
  end
  
  #あるユーザーをフォローしている人全員を取得するアクションが必要
  
  def followers
    # あるユーザーにフォローしている人の情報を全て取得する
    # user.rbにてfollowersの定義をしている為、使用できる記述
    @user = User.find(params[:id])
    @users = User.followers
    
    # user = User.find(params[:user_id])
    # @users = user.followers
  end
  
  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end

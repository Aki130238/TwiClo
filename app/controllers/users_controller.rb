class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tweets_path(@user.id), notice: "登録しました"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to users_path, notice: "ユーザー情報を編集しました！"
    else
      flash[:notice] = "編集に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "ユーザーを削除しました！"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

end

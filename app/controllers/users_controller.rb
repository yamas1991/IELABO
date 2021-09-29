class UsersController < ApplicationController

  def index
    @shops = Shop.all
    @reviews = Review.all.order(created_at: :desc).page(params[:page]).per(4)
    if user_signed_in?
      @myreviews = Review.where(user_id: current_user.id)
    end
  end

  def show
    @user = User.find(params[:id])
    @myreviews = Review.where(user_id: current_user.id)
    @reviews = Review.all.order(created_at: :desc).page(params[:page]).per(4)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "アップデート完了"
      redirect_to user_path
    else
      flash.now[:alert] = "更新に失敗しました。入力漏れはありませんか？"
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :profile, :external_link, :image)
    end

end

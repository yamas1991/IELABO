class UsersController < ApplicationController

  def index
    @shops = Shop.all
  end

  def show
    @user = User.find(params[:id])
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

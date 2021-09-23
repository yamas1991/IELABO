class ShopsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @shops = Shop.all
  end

  def new
    @shops = Shop.new
  end

  def create
    @shops = Shop.new(shops_params)
    if @shops.save
         redirect_to shops_path, notice: "ショップを追加しました！！"
    else
      @shops = Shop.new(shops_params)
      flash.now[:alert] = "ショップの追加に失敗しました。入力漏れはありませんか？"
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shops_params)
      flash[:notice] = "アップデート完了"
      redirect_to shops_path
    else
      render :edit
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_path
  end

  private
    def shops_params
      params.require(:shop).permit(:shopname, :address, :opentime, :external_link, :image)
    end

end
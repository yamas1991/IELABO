class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.order(created_at: :desc).page(params[:page]).per(4)
    @user = current_user
  end

  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save!
         redirect_to review_path(@review), notice: "レビューを投稿しました！！"
    else
      @review = Review.new(review_params)
      flash.now[:alert] = "レビューの投稿に失敗しました。入力漏れはありませんか？"
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "レビューのアップデート完了"
      redirect_to review_path
    else
      flash.now[:alert] = "レビューの更新に失敗しました。入力漏れはありませんか？"
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end

  private
    def review_params
      params.require(:review).permit(:title, :body, :evaluation, :image, :shop_id)
    end

end

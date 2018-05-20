class ShopCommentsController < ApplicationController
  # before_action :authenticate_user!

  def show
    @shop_comment = ShopComment.find(params[:id])
  end

  def new
    @shop = Shop.find(params[:shop_id])
    @shop_comment = @shop.shop_comments.new
  end

  def edit
    @shop = Shop.find(params[:shop_id])
    @shop_comment = ShopComment.find(params[:id])
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @shop_comment = @shop.shop_comments.create(shop_comment_params)

    if @shop_comment.save
      redirect_to shop_path(@shop), notice: "Sweet. You added a shop detail."
    else
      render 'new'
    end
  end

  def update
    @shop = Shop.find(params[:shop_id])
    @shop_comment = ShopComment.find(params[:id])

    if @shop_comment.update(shop_comment_params)
      redirect_to shop_shop_comment_path(@shop, @shop_comment), notice: "Sweet, you updated a Detail."
    else
      render 'edit'
    end
  end

  def destroy
    @shop_comment = ShopComment.find(params[:id])
    @shop_comment.destroy
    redirect_to shop_path(@shop_comment.shop), alert: "Oh nos, you deleted a detail!"
  end

  private
    def shop_comment_params
      params.require(:shop_comment).permit(:heading, :body)
    end

end

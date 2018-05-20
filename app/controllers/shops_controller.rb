class ShopsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @shops = Shop.all
    @placeholder_shop = "/images/shops/default.jpg"
  end

  def show
    @shop = Shop.find(params[:id])
    @placeholder_shop = "/images/shops/default.jpg"
    @placeholder_drink = "/images/drinks/default.jpg"
  end

  def new
    @shop = Shop.new
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      redirect_to @shop, notice: "A new shop was created."
    else
      render 'new'
    end
  end

  def update
    @shop = Shop.find(params[:id])

    if @shop.update(shop_params)
      redirect_to @shop, notice: "Sweet, you updated a shop."
    else
      render 'edit'
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path, alert: "You deleted a shop."
  end

  private
    def shop_params
      params.require(:shop).permit(:img_url, :name, :shop_type, :address)
    end

end

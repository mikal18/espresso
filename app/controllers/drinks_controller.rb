class DrinksController < ApplicationController
  # before_action :authenticate_user!

  def show
    @drink = Drink.find(params[:id])
    @placeholder_drink = "/images/drinks/default.jpg"
  end

  def new
    @shop = Shop.find(params[:shop_id])
    @drink = @shop.drinks.new
  end

  def edit
    @shop = Shop.find(params[:shop_id])
    @drink = Drink.find(params[:id])
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @drink = @shop.drinks.create(drink_params)

    if @drink.save
      redirect_to shop_path(@shop), notice: "Sweet. You added some mo' coffee."
    else
      render 'new'
    end
  end

  def update
    @shop = Shop.find(params[:shop_id])
    @drink = Drink.find(params[:id])

    if @drink.update(drink_params)
      redirect_to shop_drink_path(@shop, @drink), notice: "Sweet, you updated a drink."
    else
      render 'edit'
    end
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
    redirect_to shop_path(@drink.shop), alert: "Oh nos, you deleted some coffees!"
  end

  private
    def drink_params
      params.require(:drink).permit(:shop_id, :img_url, :name, :kind_of_drink, :roast, :flavor, :thoughts)
    end

end

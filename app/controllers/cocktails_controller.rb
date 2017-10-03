class CocktailsController < ApplicationController

    before_action :set_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose=Dose.new
    @ingredients = Ingredient.all
    # @review=Review.new (si on embbedde le form dans le show de restaurant)
    # assigns the requested restaurant as @restaurant (FAILED - 2)
    # / @restaurant = Restaurant.find(params[:id])/
  end

  def new
    @cocktail = Cocktail.new
  end

  def destroy
    set_cocktail
    @cocktail.destroy
    redirect_to cocktails_path
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end

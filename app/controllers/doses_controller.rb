class DosesController < ApplicationController


  def new
    # we need @restaurant in our `simple_form_for`
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def destroy
     @dose = Dose.find(params[:id])
     @dose.destroy
     redirect_to cocktails_path
   end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    # we need `restaurant_id` to asssociate review with corresponding restaurant

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

end

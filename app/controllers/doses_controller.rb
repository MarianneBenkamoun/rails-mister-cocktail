class DosesController < ApplicationController

   def new
     # we need @restaurant in our `simple_form_for`
     @cocktail = Cocktail.find(params[:cocktail_id])
     @dose = Dose.new
   end

   def create
     @dose = Dose.new(dose_params)
     # we need `restaurant_id` to asssociate review with corresponding restaurant
     @cocktail = Cocktail.find(params[:cocktail_id])
     @dose.cocktail = @cocktail

     if @dose.save
       redirect_to cocktail_path(@cocktail)
     else
       render :new
     end
   end

   private

   def review_params
     params.require(:dose).permit(:description)
   end

end

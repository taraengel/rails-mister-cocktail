class CocktailsController < ApplicationController

  def index
        @cocktails = Cocktail.all
        end

        def show
          @cocktail = Cocktail.find(params[:id])
        end

        def new
          @cocktail = Cocktail.new
        end

        def create
          @cocktail = Cocktail.create(cocktail_params)
          if @cocktail.save
            redirect_to cocktail_path(@cocktail)
          else
            render 'new'
          end
        end

        def edit
        end

        def update
          @cocktail.update(cocktail_params)
          redirect_to cocktail_path(@cocktail)
        end

        def destroy
          @cocktail.destroy
          redirect_to cocktails_path
        end

        private

        def cocktail_params
          params.require(:cocktail).permit(:name)
        end

        def find_cocktail
          @cocktail = Cocktail.find(params[:id])
        end


end

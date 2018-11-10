class DosesController < ApplicationController

  before_action :find_dose, only: [:destroy]

  def index
    @doses = Dose.all
    end

    def show
      @dose = Dose.find(params[:id])
    end

    def new
      @dose = Dose.new
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    def create
      @dose = Dose.create(dose_params)
      @cocktail = Cocktail.find(params[:cocktail_id])
      @dose.cocktail = @cocktail
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
        render 'new'
      end
    end

    def edit
    end

    def update
      @dose.update(dose_params)
      redirect_to dose_path(@dose)
    end

    def destroy
      @cocktail = Cocktail.find(@dose.cocktail.id)
      @dose.destroy
      redirect_to cocktail_path(@cocktail)
    end

    private

    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end

    def find_dose
      # raise
      @dose = Dose.find(params[:id])
    end
end


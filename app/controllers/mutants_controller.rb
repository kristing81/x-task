class MutantsController < ApplicationController
  def index
    @mutants = Mutant.all
  end

  def show
    @mutant = Mutant.find(params[:id])
  end

  def new
    @mutant = Mutant.new
  end

  def create
    @mutant = Mutant.new(mutant_params)
    if @mutant.save
      flash[:notice] = "Mutant #{@mutant.name} was created"
      redirect_to mutants_path
    else
      flash[:error] = "There was a complication saving your Mutant.  Please try again"
      render :new
    end
  end

  def edit
    @mutant = Mutant.find(params[:id])
  end

  def update
    @mutant = Mutant.find(params[:id])
    if @mutant.update_attributes(mutant_params)
      redirect_to @mutant
    else
      render :edit
    end
  end

  def destroy
    @mutant = Mutant.find(params[:id])
    if @mutant.destroy
      flash[:notice] = "Your mutant was destroyed"
    else
      flash[:error] = "Your mutant is still here.  Try destroying again"
    end
    redirect_to mutants_path    
  end

  private
  def mutant_params
    params.require(:mutant).permit(:name)
  end
end

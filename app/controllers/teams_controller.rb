class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:notice] = "Team #{@team.name} was created"
      redirect_to teams_path
    else
      flash[:error] = "There was a complication saving your Team.  Please try again"
      render :new
    end
    
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
        redirect_to @team
    else
      render :edit
    end
  end


  def destroy
    @team = Team.find(params[:id])
    if @team.destroy
      flash[:notice] = "Your team was destroyed"
    else
      flash[:error] = "Your team is still here.  Try destroying again"
    end
    redirect_to teams_path    
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end

class TeamsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    if signed_in?
      @team = Team.new
      @team.user_id = current_user.id
    else
      flash[:notice] = "Tsk tsk tsk, you can't go creating teams just yet. Try signing in..."
      redirect_to root_path
    end
  end

  def create
    if signed_in?
      @team = current_user.teams.build(team_params)
      if @team.save
        flash[:success] = "'#{@team.name}' created successfully!"
        redirect_to @team
      else
        render 'new'
      end
    else
      redirect_to root_path
    end
  end

  private

    def team_params
      params.require(:team).permit(:name, :country_id, :user_id)
    end

end

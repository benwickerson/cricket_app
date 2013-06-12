class TeamsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
      if !params[:user_id].blank?
        @teams = Team.where("user_id = ?", params[:user_id])
      else
        @teams = Team.all
      end
  end

  def show
    @team = Team.find(params[:id])
    @members = @team.team_memberships.order('position')
  end

  def new
    if signed_in?
      @team = Team.new
      @team.user_id = current_user.id
      member = @team.team_memberships.build
    else
      flash[:notice] = "Tsk tsk tsk, you can't go creating teams just yet. Try signing in..."
      redirect_to root_path
    end
  end

  def create
    if signed_in?
      @team = current_user.teams.build(team_params)
      debugger
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
      params.require(:team).permit(:name, :country_id, :user_id, :ground_id, team_memberships_attributes: :player_id)
    end

end

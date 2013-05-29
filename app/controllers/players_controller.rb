class PlayersController < ApplicationController

  before_action :signed_in_user, only: [:new, :update]
  before_action :admin_user, only: [:new, :update]

  def index
    @players = Player.all
    respond_to do |format|
      format.html
      format.csv { send_data @players.to_csv }
    end
  end

  def show
    @player = Player.find(params[:id])
  end
  
  def new
    if admin_user
      @player = Player.new
    else
      flash[:notice] = "Tsk tsk tsk, you can't go creating players just yet."
      redirect_to root_path
    end
  end

  def create
    if admin_user
      @player = Player.new(player_params)
      if @player.save
        flash[:success] = "#{@player.first_name} #{@player.last_name} created successfully!"
        redirect_to @player
      else
        render 'new'
      end
    else
      redirect_to root_path
    end
  end

  def edit
    if signed_in? && admin_user
      @player = Player.find(params[:id])
    else
      flash[:notice] = "Tsk tsk tsk, you can't go editing players just yet."
      redirect_to players_path
    end
  end

  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(player_params)
      flash[:success] = "All done - #{@player.first_name} #{@player.last_name} updated."
      redirect_to @player
    else
      render 'edit'
    end
  end


  private

    def player_params
      params.require(:player).permit(:first_name, :middle_name, :last_name, :dob, :country_id, :specialism_id, :hand, :biography)
    end

    def admin_user
      current_user.admin?
    end

end

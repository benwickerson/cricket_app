class GroundsController < ApplicationController

  def index
    @grounds = Ground.all
  end

  def show
    @ground = Ground.find(params[:id])
  end

  def new
    if admin?
      @ground = Ground.new
    else
      flash[:notice] = "Tsk tsk tsk, you can't go creating grounds just yet."
      redirect_to root_path
    end
  end

  def create
    if admin?
      @ground = Ground.new(ground_params)
      if @ground.save
        flash[:success] = "#{@ground.name} created successfully!"
        redirect_to @ground
      else
        render 'new'
      end
    else
      redirect_to root_path
    end
  end

  def edit
    if admin?
      @ground = Ground.find(params[:id])
    else
      flash[:notice] = "Tsk tsk tsk, you can't go editing grounds just yet."
      redirect_to players_path
    end
  end

  def update
    @ground = Ground.find(params[:id])
    if @ground.update_attributes(ground_params)
      flash[:success] = "All done - #{@ground.name} updated."
      redirect_to @ground
    else
      render 'edit'
    end
  end

  private

    def ground_params
      params.require(:ground).permit(:name, :address, :country_id, :capacity, :url)
    end

end

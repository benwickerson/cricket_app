class UsersController < ApplicationController
  before_action :signed_in_user,  only: [:index, :edit, :update, :destroy]
  before_action :correct_user,    only: [:edit, :update]
  before_action :admin_user,      only: :destroy

  def show
    @user = User.find(params[:id])
  end

  def new
    if !signed_in?
      @user = User.new
    else
      flash[:notice] = "You are already in an account, dufus.  Sign out if you really want to create a new one."
      redirect_to root_path
    end
  end

  def create
    if !signed_in?
      @user = User.new(user_params)
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to Cricket, #{@user.name}!"
        redirect_to @user
      else
        render 'new'
      end
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "All done - congratulations"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "They dun gone."
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end

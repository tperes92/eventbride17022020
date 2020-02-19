class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  before_action :user

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end
  
  def check_user
    redirect_to current_user unless current_user.id.to_i == params[:id].to_i
  end

  def user
    @user = User.find(params[:id])
  end
end

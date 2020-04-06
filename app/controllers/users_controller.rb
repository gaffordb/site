class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.find_or_create_by!(fingerprint = user_params[:fingerprint])
    @user.update(user_params)

    if @user.save
      # Handle a successful save.
      redirect_to @user, notice:  ""
      flash[:success] = "Your profile has been successfully updated."

    else
      render 'new'
    end

  end
  private

  def user_params
    params.require(:user).permit(:name, :password, :fingerprint)
  end
end

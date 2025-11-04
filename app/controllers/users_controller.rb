class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = policy_scope(User)
  end

  def show
    @user = current_user
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user

    if @user.update(user_params)
      redirect_to profile_path, notice: "Profile updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit_password
    @user = current_user
    authorize @user
  end

  def update_password
    @user = current_user
    authorize @user

    if @user.update_with_password(password_params)
      bypass_sign_in(@user)
      redirect_to profile_path, notice: 'Password updated successfully.'
    else
      render :edit_password, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    authorize @user

    @user.destroy
    redirect_to root_path, notice: "Your account has been successfully deleted."
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end

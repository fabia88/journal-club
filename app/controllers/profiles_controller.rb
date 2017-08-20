class ProfilesController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] = "Profile successfully updated."
    else
      flash[:notice] = "Search keywords field must not be blank." if @user.errors[:search_keywords].any?
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :education,
      :job_description,
      :research_interests,
      :avatar,
      search_keywords: []
      )
  end
end

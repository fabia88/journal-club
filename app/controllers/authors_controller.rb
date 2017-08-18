class AuthorsController < ApplicationController
  def confirm_authorship
    # @user = User.find(params[:id])
    # @author =
   return true if Author.find_by_user_id(current_user.id)
  end
end

# User can click on a link/button to toggle ownership of paper on

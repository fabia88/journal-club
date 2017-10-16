class AuthorsController < ApplicationController
  def confirm_authorship
    @author = Author.find(params[:id])
    @paper = Paper.find(params[:paper_id])
    @author.user = current_user
    if @author.save
      redirect_to paper_path(@paper)
      flash[:notice] = "You are now an author."
    else
      redirect_to paper_path(@paper)
      flash[:danger] = "Something went wrong!"
    end
  end
end

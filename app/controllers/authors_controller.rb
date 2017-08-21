class AuthorsController < ApplicationController
  def confirm_authorship

    @author = Author.find(params[:id])
    @paper = Paper.find(params[:paper_id])
    @author.user = current_user
    if @author.save
      # @author.user = current_user
      # if params[:paper]
      #   paper_path(Paper.find(params[:paper].to_i))

      redirect_to paper_path(@paper)
      flash[:notice] = "You are now an author."
    else
      redirect_to paper_path(@paper)
      flash[:danger] = "Something went wrong!"
    end

    # hash = author_params
    # hash[:name] = hash["first_name"] + " " + hash["last_name"]
    # @author = Author.new(name: "#{current_user.first_name} #{current_user.last_name}")

    # @author.user = current_user
  end

  # def author_params
  #   params.require(:author).permit(:name)
  # end
end

   # return true if Author.find_by_user_id(current_user.id)

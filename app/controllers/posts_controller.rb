class PostsController < ApplicationController
  def new
    @post = Post.new
    @paper = Paper.find(params[:paper_id])
    @lab = Lab.find(params[:lab_id])
  end

  def create
    @lab = Lab.find(params[:lab_id])
    @post = Post.new(post_params)
    @post.user = current_user
    @post.lab = @lab
    @post.paper = Paper.find(params[:paper_id]) if params[:paper_id]
    if !current_user.joined_labs.include?(@lab) || !(current_user.memberships.find_by_lab_id(@lab).status == "accepted")
      redirect_to lab_path(@lab)
      flash[:alert] = "Only accepted members can post."
    elsif @lab.archived == true
      redirect_to root_path
      flash[:alert] = "Cannot post to an archived lab."
    else
      if @post.save
        redirect_to lab_path(@lab)
        flash[:notice] = "Post successfully created."
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user
    if @post.save
      @membership = Membership.new(status: "accepted")
      @membership.user = current_user
      @membership.post = @post
      @membership.save
      redirect_to post_path(@post)
      flash[:notice] = "Post successfully created"
    else
      render 'new'
    end
  end

  private

  def post_params
      params.require(:post).permit(:content)
  end
end

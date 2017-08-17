class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user
    if @post.save
      @participant = Participant.new(status: "accepted")
      @participant.user = current_user
      @participant.post = @post
      @participant.save
      redirect_to post_path(@post)
      flash[:notice] = "Post successfully created"
    else
      render 'new'
    end
  end

    # From paper page, click on share and post it to lab
    # From lab...

  private

  def post_params
      params.require(:post).permit(:content)
  end
end

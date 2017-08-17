class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
  end

    # From paper page, click on share and post it to lab
    # From lab...

    private

    def post_params
      params.require(:post).permit(:content)
    end
  end

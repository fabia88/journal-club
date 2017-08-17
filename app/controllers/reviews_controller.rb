class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @paper = Paper.find(params[:paper_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.paper = @paper
    if @review.save
      redirect_to paper_path(@paper)
      flash[:notice] = "Review successfully created."
    else
      render 'papers/show'
    end
  end

  def review_params
    params.require(:review).permit(:content, :user_id, :paper_id)
  end
end

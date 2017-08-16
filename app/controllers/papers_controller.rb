class PapersController < ApplicationController
  def index
    @papers = Paper.all

    if params[:search].present?
      @papers = @papers.select{|paper| paper.title.downcase.include?(params[:search].downcase)}
    end
  end

  def show
    @paper = Paper.find(params[:id])
    @review = Review.new
  end
end

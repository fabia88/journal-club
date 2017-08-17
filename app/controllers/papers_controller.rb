class PapersController < ApplicationController
  def index
    @keywords = current_user.search_keywords
    if @keywords.nil?
      @papers = []
    else
      @papers = []
      @keywords.each do |word|
        Paper.where("title like ?", "%#{word}%").each do |paper|
          @papers << paper
        end
        Paper.where("abstract like ?", "%#{word}%").each do |paper|
          @papers << paper
        end
      end
      return @papers
    end
    if params[:search].present?
      @papers = @papers.select{|paper| paper.title.downcase.include?(params[:search].downcase)}
    end
  end

  def show
    @paper = Paper.find(params[:id])
    @review = Review.new
  end
end

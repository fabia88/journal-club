class PapersController < ApplicationController
  def index
    # keywords
    @keywords = params[:keywords].presence || current_user.search_keywords
    if @keywords.nil?
      @papers = []
    else
      conditions = []
      conditions_words = {}
      @keywords.each_with_index do |word, index|
        conditions << "title like :word_#{index} OR abstract like :word_#{index}"
        conditions_words["word_#{index}".to_sym] = "%#{word}%"
      end
      conditions = conditions.join(" OR ")
      @papers = Paper.where(conditions, conditions_words)
    end
    if params[:date].present?
      @papers = @papers.where(date: params[:date])
    end
    @sources = @papers.distinct.pluck(:source)
    if params[:source].present?
      @papers = @papers.where(source: params[:source])
    end
  end

  def show
    @paper = Paper.find(params[:id])
    @labs = current_user.joined_labs
    @review = Review.new
  end
end

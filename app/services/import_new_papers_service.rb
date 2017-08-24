class ImportNewPapersService
  def initialize(number_of_papers = 1000)
    @number_of_papers = number_of_papers
  end

  def call
    papers_ids = GetPapersIdsService.new(@number_of_papers).call

    papers_ids.each do |paper_id|
      paper_details = GetPaperDetailsService.new(paper_id).call
      CreatePaperService.new(paper_details).call
    end

    # PREVIOUS IMPLEMENTATION: fetching all at once
    # papers_details = GetPapersDetailsService.new(papers_ids).call
    # CreatePapersService.new(papers_details).call
  end
end

class ImportNewPapersService
  def initialize(number_of_papers = 3000)
    @number_of_papers = number_of_papers
  end

  def call
    papers_ids = GetPapersIdsService.new(@number_of_papers).call
    papers_details = GetPaperDetailsService.new(papers_ids).call
    CreatePapersService.new(papers_details).call
  end
end

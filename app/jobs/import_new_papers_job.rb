class ImportNewPapersJob < ApplicationJob
  def perform
    number_of_papers = ENV["PAPERS_IMPORT_COUNT"].to_i if ENV["PAPERS_IMPORT_COUNT"]
    ImportNewPapersService.new(number_of_papers).call
  end
end

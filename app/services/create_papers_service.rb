class CreatePapersService
  def initialize(papers_details)
    @papers_details = papers_details
  end

  def call
    @papers_details.each do |paper_details|
      authors = paper_details.delete(:authors)
      # binding.pry
      paper_obj = Paper.create!(paper_details)
      authors.each do |author|
        author_obj = Author.create(name: author["name"])
        PaperAuthor.create(paper: paper_obj, author: author_obj)
      end
    end
  end
end

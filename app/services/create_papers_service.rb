class CreatePapersService
  def initialize(papers_details)
    @papers_details = papers_details
  end

  def call
    @papers_details.each do |paper_details|
      next if Paper.find_by_paper_id(paper_details[:paper_id])

      authors = paper_details.delete(:authors)
      paper_obj = Paper.create!(paper_details)

      authors.each do |author|
        author_obj = Author.find_by_name(author["name"])
        author_obj ||= Author.create!(name: author["name"])

        PaperAuthor.create(paper: paper_obj, author: author_obj)
      end
    end
  end
end

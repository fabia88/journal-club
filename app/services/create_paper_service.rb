class CreatePaperService
  def initialize(paper_details)
    @paper_details = paper_details
  end

  def call
    return if Paper.where(paper_id: @paper_details[:paper_id]).exists?

    authors = @paper_details.delete(:authors)
    paper_obj = Paper.create!(@paper_details)

    authors.each do |author|
      author_obj = Author.find_by_name(author["name"])
      author_obj ||= Author.create!(name: author["name"])

      PaperAuthor.create(paper: paper_obj, author: author_obj)
    end
  end
end

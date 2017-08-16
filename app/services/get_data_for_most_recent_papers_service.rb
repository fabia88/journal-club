class GetDataForMostRecentPapersService
  require "open-uri"
  require "nokogiri"
  def initialize(imported_papers_count = 10)
    @imported_papers_count = imported_papers_count
  end

  def call
    url = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&reldate=1&datetype=pdat&retmax=#{@imported_papers_count}&retmode=json"
    papers_ids = extract_papers_ids(url)
    papers_ids.map do |paper_id|
      sleep 1
      paper_details   = get_paper_details(paper_id)
      paper_abstract  = get_abstract(paper_id)
      puts "Paper #{paper_id} done!"
      # merge two hashes together
      paper_details.merge({abstract: paper_abstract, paper_id: paper_id})

      # authors_attributes = paper_details.delete(:authors)

      # paper = Paper.new(paper_details)
      # paper.abstract = paper_abstract

      # paper.save!

      # authors_attributes.each do |author_attributes|
      #   author = Author.create(name: author_attributes["name"])
      #   PaperAuthor.create(paper: paper, author: author)
      # end

    end
  end

  private
  def extract_papers_ids(url)
    return JSON.parse(open(url).read)["esearchresult"]["idlist"]
  end

  def get_paper_details(paper_id)
    url = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id=#{paper_id}&retmode=json"
    paper_data = JSON.parse(open(url).read)
    return {
      title: paper_data["result"]["#{paper_id}"]["title"],
      date: paper_data["result"]["#{paper_id}"]["epubdate"],
      reference: paper_data["result"]["#{paper_id}"]["elocationid"],
      source: paper_data["result"]["#{paper_id}"]["source"],
      authors: paper_data["result"]["#{paper_id}"]["authors"]
      # source_url: "http://dx.doi.org/" + paper_data["result"]["#{paper_id}"]["elocationid"]
    }

  end

  def get_abstract(paper_id)
    url = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=#{paper_id}&retmode=xml"
    file = open(url).read
    nokogiri_document = Nokogiri::XML(file)
    abstract = ""
    nokogiri_document.root.search('AbstractText').each do |abstract_tag|
      if abstract_tag.attributes["Label"]
        abstract << abstract_tag.attributes["Label"].value + ": "
      end
      abstract << abstract_tag.text
    end
    abstract
  end
end

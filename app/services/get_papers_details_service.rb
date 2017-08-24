class GetPapersDetailsService
  require "open-uri"
  require "nokogiri"
  require "json"

  def initialize(papers_ids)
    @papers_ids = papers_ids
  end

  # returns array of hashes
  def call
    @papers = @papers_ids.map do |paper_id|
      details = get_details(paper_id)
      sleep 1
      abstract_doi = get_abstract_and_doi(paper_id)
      sleep 1
      details.merge(abstract_doi)
    end
    @papers
  end

  private
  def get_details(paper_id)
    url = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id=#{paper_id}&retmode=json&tool=journal_link&email=fabia.moroni@gmail.com"
    paper_data = JSON.parse(open(url).read)
    return {
      title: paper_data["result"]["#{paper_id}"]["title"],
      date: paper_data["result"]["#{paper_id}"]["epubdate"],
      source: paper_data["result"]["#{paper_id}"]["source"],
      authors: paper_data["result"]["#{paper_id}"]["authors"],
      paper_id: paper_id
    }
  end

  def get_abstract_and_doi(paper_id)
    url = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=#{paper_id}&retmode=xml&tool=journal_link&email=fabia.moroni@gmail.com"
    nokogiri_document = Nokogiri::XML(open(url).read)
    details = {abstract: nil, reference: nil, source_url: nil}
    abstract = ""
    doi = ""
    nokogiri_document.root.search('AbstractText').each do |abstract_tag|
      if abstract_tag.attributes["Label"]
        abstract << abstract_tag.attributes["Label"].value + ": "
      end
      abstract << abstract_tag.text
    end
    nokogiri_document.root.search("ELocationID").each do |doi_tag|
      doi = doi_tag.text
      details[:reference] = doi
      details[:source_url] = "http://dx.doi.org/" + doi
    end
    details[:abstract] = abstract
    details
  end
end

class GetPapersIdsService
  require "open-uri"
  require "json"
  def initialize(number_of_papers = 2000)
    @number_of_papers = number_of_papers
  end

  def call
    url = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=hasabstract&sort=pub+date&reldate=1&datetype=pdat&retmax=#{@number_of_papers}&retmode=json&tool=journal_link&email=fabia.moroni@gmail.com"
    JSON.parse(open(url).read)["esearchresult"]["idlist"]
  end
end

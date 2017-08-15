class ImportPapersService
  def call_id
    # esearch to find id => json
    idpath = 'practice_ids.fcgi'
    serialized_ids = File.read(Rails.root.join(idpath))
    result = JSON.parse(serialized_ids)
    result["esearchresult"]["idlist"]
  end

  def call_paper_params
    # esummary to parse paper info => json
    paperpath = 'practice.fcgi'
    serialized_paper = File.read(Rails.root.join(paperpath))
    paper = JSON.parse(serialized_paper)
    {
      title: paper["result"]["28806736"]["title"],
      date: paper["result"]["28806736"]["epubdate"],
      reference: paper["result"]["28806736"]["elocationid"],
      source: paper["result"]["28806736"]["source"],
      # source_url: "http://dx.doi.org/" + paper["result"]["28806736"]["articleids"][1]["value"],
    }
  end

  def call_paper_authors
    # esummary to parse paper authors => json
    authorpath = 'practice.fcgi'
    serialized_author = File.read(Rails.root.join(authorpath))
    result = JSON.parse(serialized_author)
    result["result"]["28806736"]["authors"]
  end

  def call_paper_abstract
    # efetch to parse paper abstract => xml
    file = File.open(Rails.root.join('practice.xml'))
    document = Nokogiri::XML(file)
    abstract = ""
    document.root.search('AbstractText').each do |abstract_tag|
      if abstract_tag.attributes["Label"]
        abstract << abstract_tag.attributes["Label"].value + ": "
      end
      abstract << abstract_tag.text
    end
    abstract
  end
end

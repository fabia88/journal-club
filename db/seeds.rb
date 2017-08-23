# require_relative '../app/services/import_papers_service.rb'
# my_info = "&tool=journal-link&email=rebekka.haley@gmail.com"

puts "Destroying previous records..."
Paper.destroy_all
Author.destroy_all
PaperAuthor.destroy_all
User.destroy_all

  # users
  puts "Seeding users..."
  emails = ["anna@example.com",
    "bree@example.com",
    "zoe@example.com",
    "stephanie@example.com"
  ]
  first_names = %w(Anna Bree Zoe Stephanie)
  last_names =  %w(Smith Garcia Baker Lam)
  avatars = ["http://res.cloudinary.com/rebsrebs/image/upload/v1503233397/anna_ftergx.jpg",
    "http://res.cloudinary.com/rebsrebs/image/upload/v1503233401/bree_mafldi.jpg",
    "http://res.cloudinary.com/rebsrebs/image/upload/v1503233407/zoe_t8t6y7.jpg",
    "http://res.cloudinary.com/rebsrebs/image/upload/v1503233413/stephanie_ynrzjf.jpg"
  ]
  emails.each_with_index do |e, i|
    user = User.create!(
      email: e,
      password: "123456",
      first_name: first_names[i],
      last_name: last_names[i],
      education: "University of Amsterdam",
      job_description: "PhD student",
      research_interests: "Neuroscience",
      search_keywords: ["p53", "ferroptosis"],
      remote_avatar_url: avatars[i]
      )
  end

#   papers + authors + paper_authors
puts "Seeding papers..."
filepath = 'db/fixtures/papers.json'
papers = JSON.parse(File.read(filepath))
papers.each do |paper|
  authors = paper.delete("authors")
  paper_obj = Paper.create!(paper)
  authors.each do |author|
    author_obj = Author.find_by_name(author["name"])
    author_obj ||= Author.create!(name: author["name"])
    PaperAuthor.create(paper: paper_obj, author: author_obj)
  end
end

# #   authors
# puts "Seeding authors and paper authors..."
# authors = ImportPapersService.new.call_paper_authors
# authors.each_with_index do |a, i|
#   author = Author.new(name: a["name"])
#   author.user = User.all[i]
#   author.save!
#   p author
#   # #   paper_authors
#   paper_author = PaperAuthor.new()
#   paper_author.paper = paper
#   paper_author.author = author
#   paper_author.save!
#   p paper_author
#   p "----------------------"
# end

puts "Finished!!!!!!!"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative '../app/services/import_papers_service.rb'
my_info = "&tool=journal-link&email=rebekka.haley@gmail.com"

# puts "Destroying previous records..."
User.destroy_all
# Paper.destroy_all
# Author.destroy_all
# PaperAuthor.destroy_all

#   users
puts "Seeding users..."
jon_params = {
  first_name: "Jon",
  last_name: "Doe",
  email: "test@example.com",
  password: "123456"
}
jon = User.create!(jon_params)

#   papers
puts "Seeding papers..."
paper = Paper.new(ImportPapersService.new.call_paper_params)
paper.abstract = ImportPapersService.new.call_paper_abstract
paper.save

#   authors
puts "Seeding authors and paper authors..."
authors = ImportPapersService.new.call_paper_authors
authors.each do |a|
  author = Author.new(name: a["name"])
  author.user = jon
  author.paper = paper
  p author
end

#   paper_authors


puts "Finished!!!!!!!"


class Paper < ApplicationRecord
  has_many :reviews
  has_many :paper_authors
  has_many :authors, through: :paper_authors
  has_many :posts
  validates :title, :source, :reference, presence: true
end

class Author < ApplicationRecord
  belongs_to :user
  belongs_to :paper
  has_many :paper_authors
  has_many :papers through: :paper_authors
  validates :name, presence: true
end

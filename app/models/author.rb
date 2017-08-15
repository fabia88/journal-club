class Author < ApplicationRecord
  belongs_to :user
  has_many :papers, through: :paper_authors
  validates :name, presence: true
end

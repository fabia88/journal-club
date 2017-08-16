class Author < ApplicationRecord
  belongs_to :user, optional: true
  has_many :papers, through: :paper_authors
  validates :name, presence: true
end

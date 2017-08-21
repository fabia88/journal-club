class Paper < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :paper_authors
  has_many :authors, through: :paper_authors
  has_many :posts, dependent: :destroy
  # validates :title, :source, :reference, presence: true
end

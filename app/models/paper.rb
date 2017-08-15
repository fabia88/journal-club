class Paper < ApplicationRecord
  has_many :reviews
  has_many :authors
  has_many :posts
  validates :title, :abstract, :source, :reference, presence: true
end

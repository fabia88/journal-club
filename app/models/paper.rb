class Paper < ApplicationRecord
  has_many :reviews
  has_many :authors
  has_many :posts
end

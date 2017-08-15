class Author < ApplicationRecord
  belongs_to :user
  belongs_to :paper
  validates :name, presence: true
end

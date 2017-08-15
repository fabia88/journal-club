class Review < ApplicationRecord
  belongs_to :user
  belongs_to :paper
  validates :content, presence: true
end

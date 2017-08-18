class Post < ApplicationRecord
  belongs_to :paper, optional: true
  belongs_to :user
  belongs_to :lab
  validates :content, presence: true
end

class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :lab
  validates :status, presence: true
end

class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :lab
  validates :user, :lab, :status, presence: true
end

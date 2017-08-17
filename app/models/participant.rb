class Participant < ApplicationRecord
  attr_accessor :email
  belongs_to :user
  belongs_to :lab
  validates :user, :lab, :status, presence: true
  validates :user, uniqueness: { scope: :lab }
end

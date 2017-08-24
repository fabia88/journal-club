class Membership < ApplicationRecord
  attr_accessor :email
  belongs_to :user
  belongs_to :lab
  validates :user, :lab, :status, presence: true
  validates :user, uniqueness: { scope: :lab }

  scope :not_cancelled, -> { where.not(status: "cancelled") }
  scope :accepted_members, -> { where(status: ["accepted", "pending"]) }
  # scope :only_accepted_members, -> {where(status: "accepted") }
end

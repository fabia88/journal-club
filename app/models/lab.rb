class Lab < ApplicationRecord
  belongs_to :creator

  has_many :participants, dependent: :destroy
  has_many :posts, dependent: :destroy
  validates :name, uniqueness: true
  validates :description, presence: true
end

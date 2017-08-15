class Lab < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :requests, dependent: :destroy
  validates :name, uniqueness: true
  validates :description, presence: true
end

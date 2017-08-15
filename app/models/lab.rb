class Lab < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :posts, dependent: :destroy
  belongs_to :user
  validates :name, uniqueness: true
  validates :description, presence: true
end

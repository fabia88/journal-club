class Lab < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :participants, dependent: :destroy
  has_many :posts, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, :description, presence: true
end

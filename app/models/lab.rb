class Lab < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :creator, class_name: "User"

  has_many :memberships, dependent: :destroy
  has_many :posts, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, :description, presence: true
end

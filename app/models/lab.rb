class Lab < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :creator, class_name: "User"

  has_many :memberships, dependent: :destroy
  has_many :posts, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, :description, presence: true

  def if_member?(user)
    self.memberships.not_cancelled.find_by_user_id(user.id)
  end
end

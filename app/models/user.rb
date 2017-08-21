class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :created_labs, class_name: "Lab", foreign_key: :creator_id

  has_many :memberships, dependent: :destroy
  has_many :joined_labs, through: :memberships, source: :lab

  has_one :author, dependent: :destroy
  has_many :papers, through: :author

  has_many :posts
  has_many :reviews

  validates :first_name, :last_name, presence: true
  validate :no_blank_search_keywords

  def no_blank_search_keywords
    if self.search_keywords.any?(&:blank?)
      errors.add(:search_keywords, "No search keywords field can remain blank.")
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
end

class User < ApplicationRecord
  has_many :created_labs, class_name: "Lab", foreign_key: :creator_id

  has_many :participants, dependent: :destroy
  has_many :joined_labs, through: :participants, source: :lab

  has_one :author, dependent: :destroy
  has_many :papers, through: :author

  has_many :posts
  has_many :reviews

  validates :first_name, :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

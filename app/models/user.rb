class User < ApplicationRecord
  has_many :participants
  has_many :authors
  has_many :labs
  has_many :posts
  has_many :reviews
  validates :first_name, :last_name, :address, :password, :education, :research_interests, presence: true
  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end

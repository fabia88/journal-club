class User < ApplicationRecord
  has_many :requests
  has_many :participants
  has_many :labs
  has_many :posts
  has_many :authors
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end

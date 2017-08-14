class Post < ApplicationRecord
  belongs_to :paper
  belongs_to :user
  belongs_to :lab
end

class Author < ApplicationRecord
  belongs_to :user
  belongs_to :paper
end

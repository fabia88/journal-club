class Paper < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :paper_authors
  has_many :authors, through: :paper_authors
  has_many :posts
  # validates :title, :source, :reference, presence: true

  def is_user_potential_author?(user, author)
    user_author_name = "#{user.last_name} #{user.first_name[0]}"
    author.name == user_author_name
  end
end

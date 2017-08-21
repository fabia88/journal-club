class Paper < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :paper_authors
  has_many :authors, through: :paper_authors
  has_many :posts, dependent: :destroy
  # validates :title, :source, :reference, presence: true

  def is_user_potential_author?(user, author)

    is_user_not_already_author = self.authors.all? { user.author != author }



    user_author_name = "#{user.last_name} #{user.first_name[0]}"
    matching_names = author.name == user_author_name

    matching_names && is_user_not_already_author
  end
end

class Author < ApplicationRecord
  belongs_to :user, optional: true
  has_many :paper_authors
  has_many :papers, through: :paper_authors
  validates :name, presence: true

  def self.confirm_authorship(current_user)
   Author.find_by_user_id(current_user.id) ? true : false
  end
end


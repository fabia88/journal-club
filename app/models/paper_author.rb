class PaperAuthor < ApplicationRecord
  belongs_to :papers
  belongs_to :author
end

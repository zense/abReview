class Review < ApplicationRecord
  belongs_to :user
  belongs_to :abstract_doc
end

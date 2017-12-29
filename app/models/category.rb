class Category < ApplicationRecord
  has_many :abstract_docs
  resourcify
end

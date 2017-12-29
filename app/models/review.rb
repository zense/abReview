class Review < ApplicationRecord
  belongs_to :user
  belongs_to :abstract_doc

  extend SimplestStatus

  statuses :draft, :submitted, :archived

end

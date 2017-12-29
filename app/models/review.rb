class Review < ApplicationRecord
  belongs_to :user
  belongs_to :abstract_doc
  resourcify
  extend SimplestStatus

  statuses :draft, :submitted, :archived

  def status_enum
    Review.statuses.for_select
  end
end

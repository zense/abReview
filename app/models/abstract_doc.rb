class AbstractDoc < ApplicationRecord
  belongs_to :category
  belongs_to :user
  resourcify
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user

  extend SimplestStatus

  statuses :draft, :submitted, :archived, :accepted

  mount_uploader :attachment, AttachmentUploader

  def status_enum
    AbstractDoc.statuses.for_select
  end
end

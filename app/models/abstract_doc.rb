class AbstractDoc < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user

  extend SimplestStatus

  statuses :draft, :submitted, :archived, :accepted

  mount_uploader :attachment, AttachmentUploader
  # don't forget those if you use :attr_accessible (delete method and form caching method are provided by Carrierwave and used by RailsAdmin)
end

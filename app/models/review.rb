class Review < ApplicationRecord
  belongs_to :user
  belongs_to :abstract_doc
  resourcify
  extend SimplestStatus

  statuses :draft, :submitted, :archived

  mount_uploader :attachment, AttachmentUploader

  def status_enum
    Review.statuses.for_select
  end

  after_save do
    NotificationsMailer.review_ack(self).deliver_now if self.submitted?
    flag = false
    self.abstract_doc.reviews.each do |review|
      flag = true unless review.submitted?
    end
    NotificationsMailer.review(self).deliver_now unless flag
  end
end

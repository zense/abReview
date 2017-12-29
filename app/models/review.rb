class Review < ApplicationRecord
  belongs_to :user
  belongs_to :abstract_doc
  resourcify
  extend SimplestStatus

  statuses :draft, :submitted, :archived

  def status_enum
    Review.statuses.for_select
  end

  after_save do
    flag = false
    self.abstract_doc.reviews.each do |review|
      flag = true unless review.submitted?
    end
    NotificationsMailer.review(self).deliver_now unless flag
  end
end

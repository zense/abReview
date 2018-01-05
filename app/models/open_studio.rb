class OpenStudio < ApplicationRecord
  after_save do
    NotificationsMailer.open_studio_ack(self).deliver_now
  end
end

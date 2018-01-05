class OpenHouse < ApplicationRecord
    after_save do
      NotificationsMailer.open_house_ack(self).deliver_now
    end
end

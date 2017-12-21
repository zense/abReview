class AbstractDoc < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :reviews

  mount_uploader :attachment, AttachmentUploader
# don't forget those if you use :attr_accessible (delete method and form caching method are provided by Carrierwave and used by RailsAdmin)
  attr_accessor :attachment, :attachment_cache, :remove_attachment
end

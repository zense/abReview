class Site < ApplicationRecord
    scope :meta, lambda { |meta| where(:meta => meta).first.value }
end

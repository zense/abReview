class Page < ApplicationRecord
   # add this method for friendly urls
   def to_param
     slug
  end
end

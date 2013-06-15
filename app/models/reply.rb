class Reply < ActiveRecord::Base
  attr_accessible :reply_description
  belongs_to :query
end

class Change < ActiveRecord::Base
  attr_accessible :change_description
  belongs_to :query
end

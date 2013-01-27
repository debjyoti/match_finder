class WebLink < ActiveRecord::Base
  belongs_to :profile
  attr_accessible :link_type, :link_url
end

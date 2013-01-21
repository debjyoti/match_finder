class Profile < ActiveRecord::Base
  attr_accessible :age, :city, :country, :gender, :name
end

class Profile < ActiveRecord::Base
  attr_accessible :age, :city, :country, :gender, :name, :answers_attributes, :web_links_attributes

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: :true,
    reject_if: proc { |attrs| attrs.all? { |key, val| val.blank? } }

  has_many :web_links, dependent: :destroy
  accepts_nested_attributes_for :web_links, allow_destroy: :true,
    reject_if: proc { |attrs| attrs.all? { |key, val| val.blank? } }
end

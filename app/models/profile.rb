class Profile < ActiveRecord::Base
  attr_accessible :born, :city, :country, :gender, :name, :punch_line, :answers_attributes, :web_links_attributes, :user_questions_attributes
  validates :name, :born, :city, :country, :gender, presence: true

  belongs_to :user

  has_many :web_links, dependent: :destroy
  has_many :pings, dependent: :destroy
  accepts_nested_attributes_for :web_links, allow_destroy: :true,
    reject_if: proc { |attrs| attrs.all? { |key, val| val.blank? } }

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: :true,
    reject_if: proc { |attrs| attrs.all? { |key, val| val.blank? } }

  has_many :user_questions, dependent: :destroy
  accepts_nested_attributes_for :user_questions, allow_destroy: :true,
    reject_if: proc { |attrs| attrs.all? { |key, val| val.blank? } }
end

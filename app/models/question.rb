class Question < ActiveRecord::Base
  attr_accessible :category, :question, :weight, :options_attributes

  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, allow_destroy: :true,
    reject_if: proc { |attrs| attrs.all? { |key, val| val.blank? } }
end

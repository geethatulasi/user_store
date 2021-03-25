class Store < ApplicationRecord
  belongs_to :user
  has_many :addresses
  accepts_nested_attributes_for :addresses
end

class Address < ApplicationRecord
  belongs_to :customer

  validates :postalcode, presence: true
  validates :address, presence: true
  validates :name, presence: true

end

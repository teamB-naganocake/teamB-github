class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details

  has_one_attached :image
end

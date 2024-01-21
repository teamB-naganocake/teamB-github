class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  has_many :items, through: :order_detail

  enum payment_method: { credit_card: 0, transfer: 1 }
  
  # {0: 入金待ち, 1: 入金確認, 2: 制作中, 3: 発送準備中, 4: 発送済み}
  enum stats: { 
    awaiting_payment: 0,
    payment_confirmation: 1,
    in_process: 2,
    shipping_preparation: 3,
    already_shipped: 4
  }
end

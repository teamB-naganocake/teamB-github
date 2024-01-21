class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  # {0: 制作不可, 1: 制作待ち, 2: 制作中, 3: 制作完了}
  enum making_stats: {
    impossible_production: 0,
    awaiting_production: 1,
    in_process: 2,
    production_completed: 3
  }
end

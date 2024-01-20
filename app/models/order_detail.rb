class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  # enum making_stats: { }
  # enumで管理,{0: 制作不可, 1: 制作待ち, 2: 制作中, 3: 制作完了}
end

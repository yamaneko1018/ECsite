class Item < ApplicationRecord
 has_many :histories, dependent: :destroy
 attr_accessor :input
 validates :stock, numericality: {greater_than: 0} 
 validates :input, numericality: {greater_than_or_equal_to: 1}

 def set_order(input)
  self.stock - input.to_i
 end
 
end

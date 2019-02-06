class Item < ApplicationRecord
 has_many :histories, dependent: :destroy
 validates :stock, numericality: {greater_than: 0} 

 def set_order(input)
  self.stock - input.to_i
 end

end

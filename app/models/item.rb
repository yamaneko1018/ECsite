class Item < ApplicationRecord
 has_many :histories, dependent: :destroy
 
 def set_order(input)
  self.stock - input.to_i
 end

end

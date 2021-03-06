class Cart < ActiveRecord::Base

has_many :line_items, :dependent => :destroy

 def add_product(product_id)
   current_item = line_items.where(:product_id => product_id).first
   if current_item
      current_item.quantity += 1
   else
      current_item = LineItem.new(:product_id => product_id)
      line_items << current_item
   end
      current_item
 end

def remove_product(product_id)
   current_item = line_items.where(:product_id => product_id).first
if current_item.nil?
   p "abc"
else

   if current_item and current_item.quantity > 1
      current_item.quantity -= 1
   else 
  
      #current_item = LineItem.destroy(:product_id => product_id)
       current_item.quantity = 0
       
       #line_items << current_item
   end
      current_item
end
 end

  def total_price
  line_items.to_a.sum { |item| item.total_price }
  end
    
 def total_items
 line_items.sum(:quantity)
 end 

end

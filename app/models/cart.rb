class Cart < ActiveRecord::Base

	has_many :line_items, :dependent => :destroy #the existence of the line items is dependent on the existence of the cart 
	
	def add_product(product_id) #a method that accumulates the quantity of a product that has been added more than twice, using its id
		current_item = line_items.where(:product_id => product_id).first

		if current_item

			current_item.quantity += 1 rescue current_item.quantity
		else
			current_item = LineItem.new(:product_id=>product_id) #adding a new product to the order line, since its unique to this cart
			line_items << current_item
		end

		current_item
	end
	
	def total_price #sum of price collected from the products in cart
		line_items.to_a.sum { |item| item.total_price }
	end
	
	def total_items #displays overall quantites of items
		line_items.sum(:quantity)
	end
end

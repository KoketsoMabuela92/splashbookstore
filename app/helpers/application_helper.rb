module ApplicationHelper

	def hidden_div_if(condition, attributes = {}, &block) #if the cart is empty, it will display none in the side bar
		if condition
			attributes["style" ] = "display: none"
		end
			content_tag("div" , attributes, &block)
		end
end

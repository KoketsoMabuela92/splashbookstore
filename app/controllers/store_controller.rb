class StoreController < ApplicationController

skip_before_filter :authorize #mark only those methods that specifically need authorization

  def index
	@products = Product.all
	@cart= current_cart
  end
  
  def faq
  end

  def news
  end
 
  def contact
  end

end

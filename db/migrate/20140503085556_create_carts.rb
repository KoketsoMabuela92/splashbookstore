class CreateCarts < ActiveRecord::Migration
  
  def down 
	drop_table :carts
  end

  def change
    create_table :carts do |t|

      t.timestamps
    end
  end
end

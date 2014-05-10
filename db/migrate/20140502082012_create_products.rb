class CreateProducts < ActiveRecord::Migration

  def self.up 
	create_table :products do |t|
	
        t.string :title
	t.text :description
        t.string :image_url
        t.decimal :price, :precision => 8, :scale => 2 #making the price t have 8 digits and just 2 decimal digits

	end
  end

  def self.down 
	drop_table :products	
  end

  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price

      t.timestamps
    end
  end

end

class Product < ApplicationRecord
	require 'csv'
    
    
    validates :product_name, :product_descprition, :brand_name, presence: true
    # validates :product_name, uniqueness: true

	def self.read_csv
		csv = File.read('public/products.csv')
		CSV.parse(csv, headers: true).each do |row|
			product = find_by(product_name: "#{row.to_h["Product Name"]}" )
			if product.blank?
              create!(product_name: "#{row.to_h["Product Name"]}", product_descprition: "#{row.to_h["Product Description"]}", brand_name: "#{row.to_h["Brand Name"]}")
            end
        end
	end

	def self.write_csv
      csv = "#{Rails.root}/public/products.csv"
      headers = ["Product Name", "Product Description", "Brand Name"]
      CSV.open(csv, 'w', write_headers: true, headers: headers ) do |writer|
      	# binding.pry
      	self.all.each do |product|
      	   writer << [product.product_name, product.product_descprition, product.brand_name]
        end
      end
	end

	


end

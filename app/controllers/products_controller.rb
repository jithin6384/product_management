class ProductsController < ApplicationController
	protect_from_forgery except: :edit

  def index
  	Product.read_csv
  	@products = Product.all
  end


  def edit
  	# binding.pry
    @product = Product.find(params[:id])
    @index = params["format"].to_i
    
  end

  def save_product
    # debugger
    @product = Product.find(params["product_id"].keys.first)
    @product.update(product_name: params["product"]["product_name"],product_descprition: params["product"]["product_descprition"],brand_name: params["product"]["brand_name"] )
    Product.write_csv
    redirect_to products_path
   
  end


  def destroy 
    @product = Product.find(params[:id])
    @product.destroy
    Product.write_csv
    redirect_to products_path
  end
end

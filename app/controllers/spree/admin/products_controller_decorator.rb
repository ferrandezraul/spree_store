Spree::Admin::ProductsController.class_eval do
	# To import products from csv format
	def import
		Spree::Product.import( params[:file] )
  		redirect_to root_url, notice: "Products imported."
  	end
	
end
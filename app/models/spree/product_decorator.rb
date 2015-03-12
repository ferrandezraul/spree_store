Spree::Product.class_eval do 

	# To export all products in csv format
	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |product|
	      csv << product.attributes.values_at(*column_names)
	    end
	  end
	end

	# To import products from csv format
	def self.import( file )
		CSV.foreach( file.path, headers: true ) do |row|
			Spree::Product.create!( row.to_hash )
		end
	end

end

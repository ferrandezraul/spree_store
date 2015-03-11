#
# Create a link in admin panel to download products as CSV.
#
Deface::Override.new(:virtual_path  => "spree/admin/products/index", #/index.html.erb 
                     :insert_after => "li#new_product_link",
                     :text          => "<%= link_to 'Export Products as CSV', 
                     								 products_path( format: 'csv' ), 
                     								 { :style => 'padding:15px 15px;'} %>", # GET products as CSV
                     :name          => "registration_future")
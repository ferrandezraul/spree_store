#
# Create a link in admin panel to download products as CSV.
#
Deface::Override.new(:virtual_path  => "spree/admin/products/index", #/index.html.erb 
                     :insert_after => "li#new_product_link",
                     :text          => "<%= link_to 'Export Products as CSV', 
                     								 products_path( format: 'csv' ), 
                     								 { :style => 'padding:15px 15px;'} %>", # GET products as CSV
                     :name          => "export_products_as_csv")


#
# Create a link in admin panel to import products from CSV.
#
Deface::Override.new(:virtual_path  => "spree/admin/products/index", #/index.html.erb 
                     :insert_after => "li#new_product_link",
                     :text          => "<%= form_tag import_admin_products_path, multipart: true do %>
										  <%= file_field_tag :file %>
										  <%= submit_tag 'Import Products from CSV' %>
										<% end %>", # POST products as CSV
                     :name          => "import_products_from_csv")

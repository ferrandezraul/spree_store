#
# Create a link in admin panel to download products as CSV.
#
# Deface::Override.new(:virtual_path  => "spree/admin/products/index", #/index.html.erb
#                      :insert_after => "li#new_product_link",
#                      # Note that here I have to change the method to GET since a button uses POST by default
#                      :text          => "<%= button_to 'Export Products as CSV', products_path( format: 'csv' ), :class => 'button', :method => :get  %>", # GET products as CSV
#                      :name          => "export_products_as_csv")


#
# Create a link in admin panel to import products from CSV.
#
# Deface::Override.new(:virtual_path  => "spree/admin/products/index", #/index.html.erb
#                      :insert_after => "li#new_product_link",
#                      :text          => "<fieldset>
#                                           <%= form_tag import_admin_products_path, multipart: true do %>
#                                             <p>
#                                               <%= file_field_tag :file %>
#                                             </p>
#                                             <p>
#                                               <%= submit_tag 'Import Products from CSV',
#                                                               :disabled => true,
#                                                               data: {
#                                                                 :confirm => 'This will erase all your products. Are you sure you want to continue?'
#                                                               } %>
#                                             </p>
# 										                      <% end %>
#                                         </fieldset>", # POST products as CSV
#                      :name          => "import_products_from_csv")

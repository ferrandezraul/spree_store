#
# Create a link in admin panel to download products as CSV.
#
Deface::Override.new( :virtual_path => "spree/layouts/admin",
                      :name => "admin_export_products",
                      :insert_bottom => "[data-hook='admin_tabs']",
                      :text => "<%= button_to 'Export Products as CSV', products_path( format: 'csv' ), :class => 'button', :method => :get  %>",
                      :disabled => false )

#
# Create a link in admin panel to import products from CSV.
#
Deface::Override.new( :virtual_path => "spree/layouts/admin",
                      :name => "admin_import_products",
                      :insert_bottom => "[data-hook='admin_tabs']",
                      :text => "<fieldset>
                                  <%= form_tag import_admin_products_path, multipart: true do %>
                                    <p>
                                      <%= file_field_tag :file %>
                                    </p>
                                    <p>
                                      <%= submit_tag 'Import Products from CSV',
                                                     :disabled => true,
                                                     data: {
                                                             :confirm => 'This will erase all your products. Are you sure you want to continue?'
                                                           } %>
                                    </p>
                                  <% end %>
                                </fieldset>", # POST products as CSV
                      :disabled => false )

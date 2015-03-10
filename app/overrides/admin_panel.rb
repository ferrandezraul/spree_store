Deface::Override.new(:virtual_path  => "spree/admin/products/index", #/index.html.erb 
                     :insert_before => "li#new_product_link",
                     :text          => "<p>Export products to CSV!</p>",
                     :name          => "registration_future")
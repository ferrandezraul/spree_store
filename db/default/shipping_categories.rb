puts "Loading Shipping categories ..."

Spree::ShippingCategory.find_or_create_by!(:name => "Ecocity a domicilio")

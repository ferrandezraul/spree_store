puts "Loading Shipping categories ..."

catalan_translations = YAML.load_file("#{Rails.root}/config/locales/ca.yml")
spanish_translations = YAML.load_file("#{Rails.root}/config/locales/es.yml")

Spree::ShippingCategory.find_or_create_by!(:name => catalan_translations['ca']['ecocity_shipping_category'])
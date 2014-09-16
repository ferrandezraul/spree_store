require 'csv'

load "#{Rails.root}/db/default/shipping_categories.rb"
load "#{Rails.root}/db/default/tax_categories.rb"

puts "Loading products ..."

english_translations = YAML.load_file("#{Rails.root}/config/locales/en.yml")
catalan_translations = YAML.load_file("#{Rails.root}/config/locales/ca.yml")
spanish_translations = YAML.load_file("#{Rails.root}/config/locales/es.yml")

begin
  reducido = Spree::TaxCategory.find_by_name!(catalan_translations['ca']['tax_category_reducido'])
rescue ActiveRecord::RecordNotFound
  puts "Couldn't find #{catalan_translations['ca']['tax_category_reducido']} TaxCategory."
  exit
end

begin
  shipping_category = Spree::ShippingCategory.find_by_name!(catalan_translations['ca']['ecocity_shipping_category'])
rescue ActiveRecord::RecordNotFound
  puts "Couldn't find #{catalan_translations['ca']['ecocity_shipping_category']} ShippingCategory."
  exit
end

# Testing CSV parser
products_array = CSV.read("#{Rails.root}/db/products.csv")
products_array_clean = []
products_array.each do |product_attributes|
  # Filter headers. Note that it is assumed that headers start with '#'
  products_array_clean.push product_attributes unless product_attributes.first.starts_with?("#")
end

puts "\nMy Clean products"
products_array_clean.each do |product_attributes|
  puts "My product attributes are: #{product_attributes}"
end

products = [
  {
    :name => catalan_translations['ca']['products']['croscat']['name'],
    :name_en => english_translations['en']['products']['croscat']['name'],
    :name_es => spanish_translations['es']['products']['croscat']['name'],
    :description => catalan_translations['ca']['products']['croscat']['description'],
    :description_en => english_translations['en']['products']['croscat']['description'],
    :description_es => spanish_translations['es']['products']['croscat']['description'],
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 3.50,
    :picture => "#{Rails.root}/app/assets/images/products/bread/bread-512.png"
  },
  {
    :name => catalan_translations['ca']['products']['soca']['name'],
    :name_en => english_translations['en']['products']['soca']['name'],
    :name_es => spanish_translations['es']['products']['soca']['name'],
    :description => catalan_translations['ca']['products']['soca']['description'],
    :description_en => english_translations['en']['products']['soca']['description'],
    :description_es => spanish_translations['es']['products']['soca']['description'],
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 4.00,
    :picture => "#{Rails.root}/app/assets/images/products/bread/bread-512.png"
  }
]

products.each do |product_attrs|
  Spree::Config[:currency] = "EUR"

  # Create product with attributes except picture
  p = Spree::Product.create!(product_attrs.except( :picture, :name_en, :name_es, :description_en, :description_es ) )

  Spree::Product::Translation.create!( { :spree_product_id => p.id,
                                         :locale => :en,
                                         :name => product_attrs[:name_en],
                                         :description => product_attrs[:description_en] } )

  Spree::Product::Translation.create!( { :spree_product_id => p.id,
                                         :locale => :es,
                                         :name => product_attrs[:name_es],
                                         :description => product_attrs[:description_es] } )

  # Add picture to the master product
  p.master.images.create!( :attachment => File.open( product_attrs[:picture] )  )

end
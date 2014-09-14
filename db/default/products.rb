load "#{Rails.root}/db/default/shipping_categories.rb"
load "#{Rails.root}/db/default/tax_categories.rb"

puts "Loading products ..."

english_translations = YAML.load_file("#{Rails.root}/config/locales/en.yml")
catalan_translations = YAML.load_file("#{Rails.root}/config/locales/ca.yml")

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

products = [
  {
    :name => english_translations['en']['products']['croscat'],
    :description => 'Pan muy rico con varias semillas',
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 3.50,
    :picture => "#{Rails.root}/app/assets/images/products/bread/bread-512.png"
  },
  {
    :name => english_translations['en']['products']['soca'],
    :description => 'Pan muy rico con varias semillas',
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
  p = Spree::Product.create!(product_attrs.except( :picture ) )

  # Add picture to the master product
  p.master.images.create!( :attachment => File.open( product_attrs[:picture] )  )

end
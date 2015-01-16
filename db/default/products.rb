load "#{Rails.root}/db/default/shipping_categories.rb"
load "#{Rails.root}/db/default/tax_categories.rb"

puts 'Loading products ...'

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
    :name => "Croscat",
    :description => 'Pan muy rico con varias semillas',
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 3.50
  },
  {
    :name => "Soca",
    :description => 'Pan muy rico con varias semillas',
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 4.00
  }
]

products.each do |product_attrs|
  Spree::Config[:currency] = "EUR"

  Spree::Product.create!(product_attrs)
end

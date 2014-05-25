load "#{Rails.root}/db/default/shipping_categories.rb"
load "#{Rails.root}/db/default/tax_categories.rb"

puts "Loading products ..."

begin
  reducido = Spree::TaxCategory.find_by_name!("Reducido")
rescue ActiveRecord::RecordNotFound
  puts "Couldn't find 'Reducido' TaxCategory."
  exit
end

begin
  shipping_category = Spree::ShippingCategory.find_by_name!("Ecocity a domicilio")
rescue ActiveRecord::RecordNotFound
  puts "Couldn't find 'Ecocity a domicilio' ShippingCategory."
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

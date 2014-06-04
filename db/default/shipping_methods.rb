load "#{Rails.root}/db/default/zones.rb"

puts "Loading Shipping Methods ..."

catalan_translations = YAML.load_file("#{Rails.root}/config/locales/ca.yml")
spanish_translations = YAML.load_file("#{Rails.root}/config/locales/es.yml")

begin
eu_zone = Spree::Zone.find_by_name!("EU_VAT")
rescue ActiveRecord::RecordNotFound
  puts "Couldn't find 'EU_VAT' zone. Did you run `rake db:seed` first?"
  puts "That task will set up the countries, states and zones required for Spree."
  exit
end

shipping_category = Spree::ShippingCategory.find_or_create_by!(:name => catalan_translations['ca']['ecocity_shipping_category'])

Spree::ShippingMethod.create!(
    :name => "Ecocity a domicili Flat Rate",
    #:zones => [eu_zone],
    :tax_category_id => Spree::TaxCategory.find_or_create_by!(:name => "General").id,
    :calculator => Spree::Calculator::Shipping::FlatRate.create!,
    :shipping_categories => [shipping_category]
)

{
  "Ecocity a domicili Flat Rate" => [6, "EUR"]
}.each do |shipping_method_name, (price, currency)|
  shipping_method = Spree::ShippingMethod.find_by_name!(shipping_method_name)
  shipping_method.calculator.preferred_amount = price
  shipping_method.calculator.preferred_currency = currency
  shipping_method.save!

  # cause current spree causes an exception trying to create a ShippinMethod with :zones list
  # I need to do it afterwards
  # https://github.com/spree/spree/issues/4524
  eu_zone.shipping_methods << shipping_method
end


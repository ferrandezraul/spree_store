puts "Loading Countries ..."

Spree::Country.create!([
  { name: "Spain", iso3: "ESP", iso: "ES", iso_name: "SPAIN", numcode: "724" }
])
Spree::Config[:default_country_id] = Spree::Country.find_by(name: "Spain").id

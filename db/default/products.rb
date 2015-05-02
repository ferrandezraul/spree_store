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
    :name => "Soca",
    :description => 'Pa molb bo amb semilles',
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 4.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Croscat",
    :description => 'Pa molb bo amb semilles',
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 3.50,
    :cost_currency => "EUR"
  },
  {
    :name => "Costella a talls",
    :description => 'Costella a talls, 0.4 kg aprox',
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 11.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Tall per rostir",
    :description => 'Tall per rostir, 0.7 kg aprox',
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 12.50,
    :cost_currency => "EUR"
  },
  {
    :name => "Bistec",
    :description => 'Bistec del pernil - 0.3 kg aprox',
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 13.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Filet",
    :description => 'Filet, 1 unitat',
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 17.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Secret",
    :description => '',
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 15.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Pedacet",
    :description => '',
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 11.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Llom",
    :description => 'Llom, 0.4 kg aprox',
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 16.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Cap de llom",
    :description => 'Cap de llom',
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 10.50,
    :cost_currency => "EUR"
  },
  {
    :name => "Ossos d'espinada",
    :description => "Ossos d'espinada, 0.3 kg aprox",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 5.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Cua",
    :description => "Cua, 1 unitat (1 kg aprox)",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 9.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Galtes",
    :description => "Galtes, 2 unitats (0.5 kg aprox)",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 7.50,
    :cost_currency => "EUR"
  },
  {
    :name => "Fetge",
    :description => "Fetge, 0.5 kg aprox",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 5.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Peu",
    :description => "Peu (2 meitats sense coure)",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 6.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Peu cuit",
    :description => "Peu cuit (2 meitats cuit)",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 7.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Llonzat",
    :description => "Llonzat 0.4 kg aprox",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 13.50,
    :cost_currency => "EUR"
  },
  {
    :name => "Cansalada",
    :description => "Cansalada",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 6.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Carn per estofar",
    :description => "Carn per estofar",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 10.50,
    :cost_currency => "EUR"
  },
  {
    :name => "Panxeta",
    :description => "Panxeta",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 9.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Botifarra",
    :description => "Botifarra 4 unitats - 0.6 kg aprox",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 11.10,
    :cost_currency => "EUR"
  },
  {
    :name => "Salsitxa",
    :description => "Salsitxa 6-8 unitats - 0.4 kg aprox",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 12.20,
    :cost_currency => "EUR"
  },
  {
    :name => "Carn picada",
    :description => "Carn picada 1 kg aprox",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 10.50,
    :cost_currency => "EUR"
  },
  {
    :name => "Hamburguesa",
    :description => "Hamburguesa 2 unitats - 0.2 kg aprox",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 11.10,
    :cost_currency => "EUR"
  },
  {
    :name => "Bull d'ou, blanc, de fetge o negre",
    :description => "Bull d'ou, blanc, de fetge o negre, 1 unitat / 0.4 kg aprox",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 16.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Botifarra d'ou, blanca, de fetge o negre",
    :description => "Botifarra d'ou, blanca, de fetge o negre, 1 unitat / 0.25 kg aprox",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 16.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Bull de cap",
    :description => "Bull de cap",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 17.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Fuet",
    :description => "Fuet",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 22.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Llonganissa",
    :description => "Llonganissa",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 26.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Xoriç embotit",
    :description => "Xoriç embotit",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 22.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Papada a granel",
    :description => "Papada a granel",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 4.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Espatlla sense pell a granel",
    :description => "Espatlla sense pell a granel",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 6.20,
    :cost_currency => "EUR"
  },
  {
    :name => "Espatlla amb pell a granel",
    :description => "Espatlla amb pell a granel",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 5.70,
    :cost_currency => "EUR"
  },
  {
    :name => "Retall magre 1ª a granel",
    :description => "Retall magre 1ª a granel",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 6.70,
    :cost_currency => "EUR"
  },
  {
    :name => "Retall sense triar",
    :description => "Retall sense triar",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 6.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Costellar sencer",
    :description => "Costellar sencer, 2 kg aprox",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 8.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Llom de canya sencer",
    :description => "Llom de canya sencer, 3 kg aprox",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 13.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Cap de llom sencer",
    :description => "Cap de llom sencer, 1,5 kg aprox",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 8.50,
    :cost_currency => "EUR"
  },
  {
    :name => "Llonzat sencer",
    :description => "Llonzat sencer 6 kg aprox",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 11.00,
    :cost_currency => "EUR"
  },
  {
    :name => "Lot 2.5 kg",
    :description => "Lot 2.5 kg
                      0,5 kg Llom       
                      0,4 kg Carn picada        
                      0,5 kg Bull       
                      0,6 kg Botifarra o salsitxa       
                      0,4 kg Panxeta o costella a trossos",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 11.95,
    :cost_currency => "EUR"
  },
  {
    :name => "Lot 4 kg",
    :description => "Lot 4 kg
                      0,5 kg Llom       
                      1,0 kg Carn picada        
                      0,5 kg Bull       
                      0,4 kg Panxeta        
                      0,6 kg Hamburguesa o botifarra        
                      0,6 kg Botifarra o salsitxa       
                      0,4 kg Cap de llom o carn per estofar ",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 11.50,
    :cost_currency => "EUR"
  },
  {
    :name => "Lot 6 kg",
    :description => "Lot 6 kg
                      0,5 kg Llom       
                      1,0 kg Carn picada        
                      0,5 kg Bull       
                      0,6 kg Costella a trossos       
                      0,6 kg Panxeta o ossos (o ambdues)        
                      0,8 kg Hamburguesa        
                      0,4 kg Cap de llom o carn per estofar       
                      1,6 kg Botifarra o salsitxa (o ambdues) ",
    :available_on => Time.zone.now,
    :tax_category => reducido,
    :shipping_category => shipping_category,
    :price => 10.95,
    :cost_currency => "EUR"
  }
]        

products.each do |product_attrs|
  Spree::Config[:currency] = "EUR"

  Spree::Product.create!(product_attrs)
end
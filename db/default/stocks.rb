country =  Spree::Country.find_by( iso: 'ES')
location = Spree::StockLocation.first_or_create! name: 'default', address1: 'Ecocity Street', city: 'Riudaura', zipcode: '12345', country: country, state: country.states.first
location.active = true
location.save!

Spree::Variant.all.each do |variant|
  variant.stock_items.each do |stock_item|
    Spree::StockMovement.create( :quantity => 100, :stock_item => stock_item )
  end
end
# Spree::Sample.load_sample("variants")

location = Spree::StockLocation.first_or_create! name: 'default'
location.active = true
location.country =  Spree::Country.where(name: 'Spain').first
location.save!


Spree::Product.all.each do |product|
  master_product = product.master
  variant = Spree::Variant.find_by!( :id => master_product.id )
  variant.stock_items.each do |stock_item|
    Spree::StockMovement.create(:quantity => 1000, :stock_item => stock_item)
  end
end

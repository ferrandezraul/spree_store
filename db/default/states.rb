puts "Loading States ..."


country = Spree::Country.find_by(name: 'Spain')

Spree::State.create!([
  { name: 'Barcelona', abbr: 'BAR', country: country },
  { name: 'Gerona', abbr: 'GER', country: country }
])

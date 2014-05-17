country = Spree::Country.find_by(name: 'Spain')

Spree::State.create!([
  { name: 'Barcelona', abbr: 'BAR', country: country },
  { name: 'Tarragona', abbr: 'TAR', country: country },
  { name: 'Gerona', abbr: 'GER', country: country }
])

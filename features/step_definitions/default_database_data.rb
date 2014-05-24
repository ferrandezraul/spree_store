Then /^I should have (\d+) taxonomies$/ do | number |
  number_taxonomies = Spree::Taxonomy.all.count
  #save_and_open_page
  assert_equal number.to_i, number_taxonomies
end


And /^I should have (\d+) taxons$/ do | number |
  number_taxons = Spree::Taxon.all.count  # Gets number of taxons and taxonomies
  #save_and_open_page
  assert_equal number.to_i, number_taxons
end

And /^I should have (\d+) country/ do | number |
  number_countries = Spree::Country.all.count
  assert_equal number.to_i, number_countries
end

And /^I should have (\d+) zone/ do | number |
  number_zones = Spree::Zone.all.count
  assert_equal number.to_i, number_zones
end

And /^the country should be (\w+)/ do |name|
  country = Spree::Country.first!
  assert_equal name, country.name
end

And /^the zone should be (\w+)/ do |name|
  zone = Spree::Zone.first!
  assert_equal name, zone.name
end

And /^I should have (\d+) states/ do | number |
  number_states = Spree::State.all.count
  assert_equal number.to_i, number_states
end


And /^the states should be (\w+) and (\w+)/ do | state1, state2 |
  states = Spree::State.all
  state1_found = false
  state2_found = false

  states.each do |state|

    if state.name == state1
      state1_found = true
    end

    if state.name == state2
      state2_found = true
    end

  end

  assert_equal true, state1_found
  assert_equal true, state2_found
end
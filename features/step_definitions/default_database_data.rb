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

And /^I should have (\d+) tax categories/ do | number |
  tax_categories = Spree::TaxCategory.all.count
  assert_equal number.to_i, tax_categories
end

And /^I should have (\d+) tax rates/ do | number |
  tax_rates = Spree::TaxRate.all.count
  assert_equal number.to_i, tax_rates
end

And /^the tax categories should be (\w+), (\w+) and (\w+)/ do | category1, category2, category3 |
  assert_equal true, Spree::TaxCategory.exists?( :name => category1 )
  assert_equal true, Spree::TaxCategory.exists?( :name => category2 )
  assert_equal true, Spree::TaxCategory.exists?( :name => category3 )
end


And /^the states should be (\w+) and (\w+)/ do | state1, state2 |
  assert_equal true, Spree::State.exists?( :name => state1 )
  assert_equal true, Spree::State.exists?( :name => state2 )
end
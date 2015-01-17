Given /^We visit the home page$/ do
  visit spree.root_path
end

Then /^I should have (\d+) taxonomies$/ do | number |
  number_taxonomies = Spree::Taxonomy.all.count
  puts number
  puts number_taxonomies

  save_and_open_page
  assert_equal number.to_i, number_taxonomies
end

When /^page is loaded$/ do
  page.status_code.should be(200)
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

And /^I should have (\d+) shipping category/ do | number |
  shipping_categories = Spree::ShippingCategory.all.count

  #Spree::ShippingCategory.all.each do |category|
  #  puts "Shipping Categoty"
  #  ap category
  #end

  assert_equal number.to_i, shipping_categories
end

And /^the tax categories should be General, Reduït and Super reduït/ do
  assert_equal true, Spree::TaxCategory.exists?( :name => 'General' )
  assert_equal true, Spree::TaxCategory.exists?( :name => 'Reduït' )
  assert_equal true, Spree::TaxCategory.exists?( :name => 'Super reduït')
end

And /^the shipping category should be Ecocity a domicilio/ do
  assert_equal true, Spree::ShippingCategory.exists?( :name => 'Ecocity a domicili')
end

And /^the tax rates should be IVA General, IVA Reducido and IVA Super Reducido/ do
  assert_equal true, Spree::TaxRate.exists?( :name => 'IVA General' )
  assert_equal true, Spree::TaxRate.exists?( :name => 'IVA Reduït' )
  assert_equal true, Spree::TaxRate.exists?( :name => 'IVA Super Reduït' )
end


And /^the states should be (\w+) and (\w+)/ do | state1, state2 |
  assert_equal true, Spree::State.exists?( :name => state1 )
  assert_equal true, Spree::State.exists?( :name => state2 )
end
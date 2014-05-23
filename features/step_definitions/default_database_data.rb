Then /^I should have (\d+) taxonomies$/ do | number |
  number_taxonomies = Spree::Taxonomy.all.count
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

And /^the country should be (\w+)/ do |name|
  country = Spree::Country.first!
  assert_equal name, country.name
end
Then /^I should have (\d+) taxonomies$/ do | number |
  number_taxonomies = Spree::Taxonomy.all.count
  assert_equal number_taxonomies, number
end


And /^I should have (\d+) taxons$/ do | number |


end
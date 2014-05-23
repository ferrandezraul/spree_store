Then /^I should have (\d+) country available/ do | number |
  number_countries = Spree::Country.all.count
  assert_equal number.to_i, number_countries
end

And /^it should be (\w+)/ do |country_name|
  countries = Spree::Country.all
  spain = countries.first!
  assert_equal country_name, spain.name
end


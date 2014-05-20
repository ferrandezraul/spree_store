Then /^I should have (\d+) taxonomies$/ do | number |
  #save_and_open_page
  page.should have_content("Categories")
end


And /^I should have (\d+) taxons$/ do | number |


end
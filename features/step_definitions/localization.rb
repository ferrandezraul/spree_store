Given /^We visit the home page$/ do
  visit spree.root_path
end

When /^page is loaded/ do
  page.status_code.should be(200)
end

And /^I set the language to (.+)/ do |locale|
  case( locale )
  when 'catalan'
    page.select 'Català', :from => 'locale'
  when 'spanish'
    page.select 'Español', :from => 'locale'
  else
    page.select 'Català', :from => 'locale'
  end

  save_and_open_page
  #visit current_path

  page.status_code.should be(200)
end


Then /^I should see the word (.+)$/ do | name |
  page.should have_content(name)
end
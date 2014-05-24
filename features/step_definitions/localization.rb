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

  # How to code this request ???
  #Started POST "/locale/set" for 127.0.0.1 at 2014-05-24 11:23:19 +0200
  #Processing by Spree::LocaleController#set as JSON
  #Parameters: {"locale"=>"es"}

  # Should be this based on output from rake routes ?
  #spree.set_locale_path( { "locale" => "es" } )

  #visit current_path

  page.status_code.should be(200)
end


Then /^I should see the word (.+)$/ do | name |
  page.should have_content(name)
end
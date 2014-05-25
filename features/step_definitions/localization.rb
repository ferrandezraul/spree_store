Given /^We visit the home page$/ do
  visit spree.root_path
end

When /^page is loaded/ do
  page.status_code.should be(200)
end

And /^I set the language to (.+)/ do |locale|
  case( locale )
  when 'catalan'
    select 'Català', :from => 'locale'
    post spree.set_locale_path, :locale => 'ca'
  when 'spanish'
    select 'Español', :from => 'locale'
    post spree.set_locale_path, :locale => 'es'
    save_and_open_page
  else
    select 'Català', :from => 'locale'
  end

  # How to code this request ???
  #Started POST "/locale/set" for 127.0.0.1 at 2014-05-24 11:23:19 +0200
  #Processing by Spree::LocaleController#set as JSON
  #Parameters: {"locale"=>"es"}

  # Should be this based on output from rake routes ?
  #spree.set_locale_path( { "locale" => "es" } )
  #post_via_redirect( spree.set_locale_path, :locale => "es" )

  #visit current_path

  #second_option_xpath = "//*[@id='#{locale}']/option[2]"
  #second_option = find(:xpath, second_option_xpath).text
  #select(second_option, :from => locale)

  page.status_code.should be(200)

  #save_and_open_page
end


Then /^I should see the word (.+)$/ do | name |
  page.should have_content(name)
end
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
    when 'spanish'
      select 'Español', :from => 'locale'
      #puts "Option #{find('#locale').find(:xpath, 'option[1]').text}"
      find('#locale').find(:xpath, 'option[1]').select_option
      sleep 12.seconds
      page.save_and_open_page
    else
      select 'Català', :from => 'locale'
  end

  page.status_code.should be(200)

  #save_and_open_page
end


Then /^I should see the word (.+)$/ do | name |
  page.should have_content(name)
end
Given /^There is a user with login (.+)$/ do | login |
  Spree::User.create( [ :id => 2,
                        :email => login,
                        :login => login,
                        :password => "spree123" ] )

  assert_equal Spree::User.exists?( :email => login ), true
end

Given /^There is a default Spree user$/ do
  pending
  #spree_auth:admin:create
end

When /^I sign in as a (.+)$/ do | login |
  visit spree.login_path

  fill_in "spree_user_email", :with => login
  fill_in "spree_user_password", :with => 'spree123'

  find( "input.button.primary" ).click

  #save_and_open_page

  page.should have_selector('a', :text => Spree.t(:logout) ) #Logout/Cerrar Sesión

  # TODO, how click_on works
  #click_on "input.button.primary"

end

Then /^I should see a link with "My Account"$/ do
  #save_and_open_page
  page.should have_selector('a', :text => Spree.t(:my_account) )
end


#Given /^I have articles titled (.+)$/ do |titles|
#  titles.split(', ').each do |title|
#    Article.create!(:title => title)
#  end
#end
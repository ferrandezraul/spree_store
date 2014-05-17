Feature: Sign-in
  In order to sign in
  As a user
  I want to sign in Ecocity

Scenario: Spree user signs in with English locale
  Given There is a user with login spree@spree.com
  When I sign in as a spree@spree.com
  Then I should see a link with "My Account"

#Scenario: Spree user signs in with Spanish locale
#  Given There is a user with login spree@spree.com
#  When I sign in as a spree@spree.com
#  And the locale is set to Spanish
#  Then I should see a link with Mi Cuenta


#@ignore
#Scenario: Admin user signs in
#  Given There is an admin user
#  When I sign in
#  Then I should see "Welcome"

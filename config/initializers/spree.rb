# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  #config.site_name = "Ecocity. De la granja a la ciudad"
end

Spree.user_class = "Spree::User"

# Overwrite logo from /home/raul/.rvm/gems/ruby-2.1.1/bundler/gems/spree-3141905d7ca6/core/app/models/spree/app_configuration.rb
Spree::Config.set( logo: 'head_logo.jpg' )
Spree::Config.set( admin_interface_logo: 'head_logo.jpg' )

#Spree::Config.set( default_meta_description: 'Ecocity' )
#Spree::Config.set( default_meta_keywords: 'Ecocity' )
Spree::Config.set( logo: 'head_logo.jpg' )
Spree::Config.set( currency: 'EUR' )
#Spree::Config.set( currency_symbol_position: 'after' )
#Spree::Config.set( currency_sign_before_symbol: false )
Spree::Config.set( logo: 'head_logo.jpg' )


SpreeI18n::Config.available_locales = [:es, :ca] # displayed on translation forms   (Publicas + privadas en desarrollo)
SpreeI18n::Config.supported_locales = [:es, :ca]      # displayed on frontend select box (Publicas cliente)

# Examples
#SpreeI18n::Config.available_locales = [:en, :es, :'pt-BR'] # displayed on translation forms
#SpreeI18n::Config.supported_locales = [:en, :'pt-BR'] # displayed on frontend select box

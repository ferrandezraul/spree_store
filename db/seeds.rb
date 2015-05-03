# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Spree::Core::Engine.load_seed if defined?(Spree::Core)    # Do not seed data from spree core
#Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

# Loads seed data under my default dir (my own countries, roles, states, tax_rates, etc .. )
default_path = File.join(File.dirname(__FILE__), 'default')

Rake::Task['db:load_dir'].reenable
Rake::Task['db:load_dir'].invoke(default_path)

user = Spree::User.create!( :email => ENV['HEROKU_STORE_EMAIL'],
                            :login => ENV['HEROKU_STORE_LOGIN'],
                            :password => ENV['HEROKU_STORE_PASSWORD'] )

user.spree_roles << Spree::Role.find_or_create_by!( name: "admin" )





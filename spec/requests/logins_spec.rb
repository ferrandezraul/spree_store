require 'rails_helper'
require 'spec_helper'
#require 'ap'

# To make Capybara 'page' work (and to make Capybara interactions like click_button or fill_in work),
# instead of retrieving with rspec's 'get', you need to retrieve with Capybara's 'visit':
#
# DEBUG: Use save_and_open_page
# Capybara matchers: http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Matchers

catalan_translations = YAML.load_file("#{Rails.root}/config/locales/ca.yml")
#spanish_translations = YAML.load_file("#{Rails.root}/config/locales/es.yml")

describe 'Home page', :type => :request, :js => true do

  describe 'GET /' do
    it 'can go to home page', :driver => :webkit  do
      get spree.root_path
      #save_and_open_page
      expect(response).to be_success

      #json = JSON.parse(response.body)
      #ap json


    end
  end

end


require 'rails_helper'
require 'spec_helper'
require 'awesome_print'


describe 'REST API access' do
  let(:user) { Spree::LegacyUser.new }

  it 'can generate an API key' do
    #pending
    #expect(user).to receive(:save!)
    #user.generate_spree_api_key!
    #expect(user.spree_api_key).not_to be_blank
  end

  it 'can serve products as json', :driver => :webkit  do
    #pending
    #get spree.products_path, :format => 'json'
    #get "/product/#{product.id}", :format => 'json'

    #  get '/api/products', :token => user.spree_api_key
    #  expect(response.status).to eq(200)

    #  ap 'response.class'
    #  ap response.class
    #  ap 'response.body.to_json'
    #  ap response.body.to_json

    #json = JSON.parse(response.body.to_json)

    #ap 'json object returned by JSON.parse'
    #ap json
  end
end
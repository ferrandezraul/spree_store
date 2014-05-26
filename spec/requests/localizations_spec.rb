require 'spec_helper'

describe "Localizations" do
  describe "GET /localizations" do
    it "changes locale to spanish", :driver => :webkit do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit spree.root_path

      page.status_code.should == 200

      select 'Español', :from => 'locale'

      # Needed to have time for locale change
      sleep 6.seconds

      page.status_code.should == 200
      save_and_open_page
      page.should have_link( "Inicio" )
    end
  end
end





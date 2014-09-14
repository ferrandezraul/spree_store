require 'spec_helper'

describe "Localizations" do
  describe "GET /localizations" do
    it "changes locale to spanish", :driver => :webkit do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit spree.root_path

      page.should have_link( "Tenda" )
      page.should have_link( "Cistella" )
      page.should_not have_link( "Inicio" )

      page.status_code.should == 200

      select 'Español', :from => 'locale'

      # Needed to have time for locale change
      sleep 6.seconds

      page.status_code.should == 200
      #save_and_open_page
      page.should have_link( "Tienda" )
      page.should have_link( "Cesta" )
      page.should_not have_link( "Cistella" )
    end
  end

  describe "GET Translataed taxonomies" do
    it "changes taxonomies name when changing locale", :driver => :webkit do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit spree.root_path

      select 'Español', :from => 'locale'

      # Needed to have time for locale change
      sleep 6.seconds

      page.status_code.should == 200

      within('nav#taxonomies') do
        within('h6.taxonomy-root:nth-child(1)') do
          expect(page).to have_content('COMPRAR POR CATEGORIAS')
        end
      end

      select 'Català', :from => 'locale'

      # Needed to have time for locale change
      sleep 6.seconds

      page.status_code.should == 200

      within('nav#taxonomies') do
        within('h6.taxonomy-root:nth-child(1)') do
          expect(page).to have_content('COMPRAR PER CATEGORIES')
        end
      end

    end
  end
end





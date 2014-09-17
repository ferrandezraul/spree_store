require 'csv'

module Columns
  NAME = 0            # Catalan name
  NAME_ES = 1         # Spanish name
  DESCRIPTION = 2     # Catalan description
  DESCRIPTION_ES = 3  # Spanish description
  TAX_CATEGORY = 4    # Tax Category (Needs to be created before)
  PRICE = 5           # Price
  PICTURE_PATH = 6    # Path to picture
end

class ProductCSV
  #  Returns array of Product attributes
  #  = Example
  #  products = [
  #  {
  #    :name => "Croscat",
  #    :name_en => "Croscat",
  #    :name_es => "Croscat",
  #    :description => "Pà molt bò",
  #    :description_en => "Pà molt bò",
  #    :description_es => "Pan muy bueno",
  #    :available_on => Time.zone.now,
  #    :tax_category => tax_category_spree_object,
  #    :shipping_category => shipping_category_spree_object,
  #    :price => 3.50,
  #    :picture => "#{Rails.root}/app/assets/images/products/bread/bread-512.png"
  #  },
  #  {
  #    :name => "Soca",
  #    :name_en => "Soca",
  #    :name_es => "Soca",
  #    :description => "Pà molt bò",
  #    :description_en => "Pà molt bò",
  #    :description_es => "Pan muy bueno",
  #    :available_on => Time.zone.now,
  #    :tax_category => tax_category_spree_object,
  #    :shipping_category => shipping_category_spree_object,
  #    :price => 4.00,
  #    :picture => "#{Rails.root}/app/assets/images/products/bread/bread-512.png"
  #  }
  #]
  def self.read( file_path )

    catalan_translations = YAML.load_file("#{Rails.root}/config/locales/ca.yml")

    # By default separator is ","
    # CSV.read(file_path, { :col_sep => ';' })
    products_array = CSV.read(file_path)

    products_array_clean = []
    products_array.each do |product_attributes|
      # Filter headers. Note that it is assumed that headers start with '#'
      products_array_clean.push product_attributes unless product_attributes.first.starts_with?("#")
    end

    my_products = []
    products_array_clean.each do |product_attributes|

      begin
        tax_category = Spree::TaxCategory.find_by_name!(product_attributes[4])
      rescue ActiveRecord::RecordNotFound
        puts "Couldn't find #{product_attributes[Columns::TAX_CATEGORY]} TaxCategory."
        exit
      end

      begin
        shipping_category = Spree::ShippingCategory.find_by_name!(catalan_translations['ca']['ecocity_shipping_category'])
      rescue ActiveRecord::RecordNotFound
        puts "Couldn't find #{catalan_translations['ca']['ecocity_shipping_category']} ShippingCategory."
        exit
      end

      my_products.push( { :name => product_attributes[Columns::NAME],
                          :name_en => product_attributes[Columns::NAME],
                          :name_es => product_attributes[Columns::NAME_ES],
                          :description => product_attributes[Columns::DESCRIPTION],
                          :description_en => product_attributes[Columns::DESCRIPTION],
                          :description_es => product_attributes[Columns::DESCRIPTION_ES],
                          :available_on => Time.zone.now,
                          :tax_category => tax_category,
                          :shipping_category => shipping_category,
                          :price => product_attributes[Columns::PRICE].to_f,
                          :picture => "#{Rails.root}/#{product_attributes[Columns::PICTURE_PATH]}" } )
    end

    my_products

  end

end
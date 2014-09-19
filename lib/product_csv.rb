require 'csv'

module Columns
  NAME = 0               # Catalan name
  NAME_ES = 1            # Spanish name
  DESCRIPTION = 2        # Catalan description
  DESCRIPTION_ES = 3     # Spanish description
  TAX_CATEGORY = 4       # Tax Category (Needs to be created before)
  PRICE = 5              # Price
  PICTURE_PATH = 6       # Path to picture
  SHIPPING_CATEGORY = 7  # Shipping category
end

class ProductCSV
  #  Returns array of hashes with Product attributes
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
  #  }
  #]
  def self.read( file_path )

    # By default separator is ","
    # CSV.read(file_path, { :col_sep => ';' })
    products = CSV.read(file_path)

    products_clean = []
    products.each do |product_attributes|
      # Filter headers. Note that it is assumed that headers start with '#'
      products_clean.push product_attributes unless product_attributes.first.starts_with?("#")
    end

    my_products = []
    products_clean.each do |product|

      begin
        tax_category = Spree::TaxCategory.find_by_name!(product[4])
      rescue ActiveRecord::RecordNotFound
        puts "Couldn't find #{product[Columns::TAX_CATEGORY]} TaxCategory."
        exit
      end

      begin
        shipping_category = Spree::ShippingCategory.find_by_name!(product[Columns::SHIPPING_CATEGORY])
      rescue ActiveRecord::RecordNotFound
        puts "Couldn't find #{product[Columns::SHIPPING_CATEGORY]} ShippingCategory."
        exit
      end

      my_products.push( { :name => product[Columns::NAME],
                          :name_en => product[Columns::NAME],
                          :name_es => product[Columns::NAME_ES],
                          :description => product[Columns::DESCRIPTION],
                          :description_en => product[Columns::DESCRIPTION],
                          :description_es => product[Columns::DESCRIPTION_ES],
                          :available_on => Time.zone.now,
                          :tax_category => tax_category,
                          :shipping_category => shipping_category,
                          :price => product[Columns::PRICE].to_f,
                          :picture => "#{Rails.root}/#{product[Columns::PICTURE_PATH]}" } )
    end

    my_products

  end

end
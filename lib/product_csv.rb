require 'csv'

class ProductCSV
  # Columns
  NAME = 0               # Catalan name
  NAME_ES = 1            # Spanish name
  DESCRIPTION = 2        # Catalan description
  DESCRIPTION_ES = 3     # Spanish description
  TAX_CATEGORY = 4       # Tax Category (Needs to be created before)
  PRICE = 5              # Price
  PICTURE_PATH = 6       # Path to picture
  SHIPPING_CATEGORY = 7  # Shipping category

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

    products = remove_headers(products)

    my_products = []
    products.each do |product|

      tax = tax_category(product[TAX_CATEGORY])
      shipping = shipping_category(product[SHIPPING_CATEGORY])

      my_products.push( { :name => product[NAME],
                          :name_en => product[NAME],
                          :name_es => product[NAME_ES],
                          :description => product[DESCRIPTION],
                          :description_en => product[DESCRIPTION],
                          :description_es => product[DESCRIPTION_ES],
                          :available_on => Time.zone.now,
                          :tax_category => tax,
                          :shipping_category => shipping,
                          :price => product[PRICE].to_f,
                          :picture => "#{Rails.root}/#{product[PICTURE_PATH]}" } )
    end

    my_products

  end

  private

  def self.remove_headers(products)
    products_clean = []
    products.each do |product_attributes|
      # Filter headers. Note that it is assumed that headers start with '#'
      products_clean.push product_attributes unless product_attributes.first.starts_with?("#")
    end

    products = products_clean
  end

  def self.tax_category(name)
    begin
      category = Spree::TaxCategory.find_by_name!(name)
    rescue ActiveRecord::RecordNotFound
      puts "Couldn't find #{name} TaxCategory."
      exit
    end

    category
  end

  def self.shipping_category(name)
    begin
      category = Spree::ShippingCategory.find_by_name!(name)
    rescue ActiveRecord::RecordNotFound
      puts "Couldn't find #{name} shipping category."
      exit
    end

    category
  end

end
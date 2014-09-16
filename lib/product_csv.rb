require 'csv'

class ProductCSV

  def self.read( file_path )

    english_translations = YAML.load_file("#{Rails.root}/config/locales/en.yml")
    catalan_translations = YAML.load_file("#{Rails.root}/config/locales/ca.yml")
    spanish_translations = YAML.load_file("#{Rails.root}/config/locales/es.yml")

    begin
      reducido = Spree::TaxCategory.find_by_name!(catalan_translations['ca']['tax_category_reducido'])
    rescue ActiveRecord::RecordNotFound
      puts "Couldn't find #{catalan_translations['ca']['tax_category_reducido']} TaxCategory."
      exit
    end

    begin
      shipping_category = Spree::ShippingCategory.find_by_name!(catalan_translations['ca']['ecocity_shipping_category'])
    rescue ActiveRecord::RecordNotFound
      puts "Couldn't find #{catalan_translations['ca']['ecocity_shipping_category']} ShippingCategory."
      exit
    end

    # By default separator is ","
    # CSV.read(file_path, { :col_sep => ';' })
    products_array = CSV.read(file_path)

    products_array_clean = []
    products_array.each do |product_attributes|
      # Filter headers. Note that it is assumed that headers start with '#'
      products_array_clean.push product_attributes unless product_attributes.first.starts_with?("#")
    end

    my_products = []
    #puts "\nMy Clean products"
    products_array_clean.each do |product_attributes|
      #puts "My product attributes are: #{product_attributes}"
      my_products.push( { :name => product_attributes[0],
                          :name_en => product_attributes[0],
                          :name_en => product_attributes[1],
                          :description => product_attributes[2],
                          :description_en => product_attributes[2],
                          :description_es => product_attributes[3],
                          :available_on => Time.zone.now,
                          :tax_category => reducido,
                          :shipping_category => shipping_category,
                          :price => product_attributes[5].to_f,
                          :picture => "#{Rails.root}/#{product_attributes[6]}" } )
    end

    products_array_clean

  end

end
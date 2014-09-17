require 'product_csv'

load "#{Rails.root}/db/default/shipping_categories.rb"
load "#{Rails.root}/db/default/tax_categories.rb"

puts "Loading products ..."

english_translations = YAML.load_file("#{Rails.root}/config/locales/en.yml")
catalan_translations = YAML.load_file("#{Rails.root}/config/locales/ca.yml")
spanish_translations = YAML.load_file("#{Rails.root}/config/locales/es.yml")

my_products = ProductCSV.read( "#{Rails.root}/db/products.csv")

#ap my_products

my_products.each do |product_attrs|
  Spree::Config[:currency] = "EUR"

  # Create product with attributes except picture
  p = Spree::Product.create!(product_attrs.except( :picture, :name_en, :name_es, :description_en, :description_es ) )

  Spree::Product::Translation.create!( { :spree_product_id => p.id,
                                         :locale => :en,
                                         :name => product_attrs[:name_en],
                                         :description => product_attrs[:description_en] } )

  Spree::Product::Translation.create!( { :spree_product_id => p.id,
                                         :locale => :es,
                                         :name => product_attrs[:name_es],
                                         :description => product_attrs[:description_es] } )

  # Add picture to the master product
  p.master.images.create!( :attachment => File.open( product_attrs[:picture] )  )

end
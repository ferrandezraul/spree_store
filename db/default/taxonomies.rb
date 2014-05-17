taxonomies = [
  { :name => I18n.t(:categorias) },
  { :name => I18n.t(:proveedor) }
]

taxonomies.each do |taxonomy_attrs|
  Spree::Taxonomy.create!(taxonomy_attrs)
end

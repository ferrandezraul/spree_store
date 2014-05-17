catalan_translations = YAML.load_file('config/locales/ca.yml')
spanish_translations = YAML.load_file('config/locales/es.yml')

taxonomy_names = [
  { :name => 'categorias' },
  { :name => 'proveedores' }
]



#taxonomy_names.each do |name|
  taxonomy = Spree::Taxonomy.create!({ :name => 'categorias' })

  Spree::Taxonomy::Translation.find_or_create_by!( :spree_taxonomy_id => taxonomy.id, :locale => 'ca', :name => 'Categories')
  Spree::Taxonomy::Translation.find_or_create_by!( :spree_taxonomy_id => taxonomy.id, :locale => 'es', :name => 'Categorias')
  #Spree::Taxonomy::Translation.find_or_create_by!( :spree_taxonomy_id => taxonomy.id, :locale => 'ca', :name => (catalan_translations['ca'][name]) )
  #Spree::Taxonomy::Translation.find_or_create_by!( :spree_taxonomy_id => taxonomy.id, :locale => 'es', :name => (spanish_translations['ca'][name']) )

#end


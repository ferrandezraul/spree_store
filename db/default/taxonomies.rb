#english_translations = YAML.load_file('config/locales/en.yml')
catalan_translations = YAML.load_file('config/locales/ca.yml')
spanish_translations = YAML.load_file('config/locales/es.yml')

taxonomies = [
    { :name => 'categorias',
      :catalan_name => (catalan_translations['ca']['taxonomies']['categorias']),
      :spanish_name => (spanish_translations['es']['taxonomies']['categorias'])
    },
    { :name => 'proveedor',
      :catalan_name => (catalan_translations['ca']['taxonomies']['proveedor']),
      :spanish_name => (spanish_translations['es']['taxonomies']['proveedor'])
    }
]

taxonomies.each { |taxonomy|

  # Create Taxonomy
  new_taxonomy = Spree::Taxonomy.create!( :position => 0,
                                          :name => taxonomy[:name] )

  puts "Taxonomy created:"
  ap new_taxonomy
  # Add Taxonomy translations
  translation = Spree::Taxonomy::Translation.find_or_create_by!( :spree_taxonomy_id => new_taxonomy.id,
                                                   :locale => 'ca',
                                                   :name => taxonomy[:catalan_name] )

  puts "Taxonomy::Translation created"
  ap translation


  translation = Spree::Taxonomy::Translation.find_or_create_by!( :spree_taxonomy_id => new_taxonomy.id,
                                                   :locale => 'es',
                                                   :name => taxonomy[:spanish_name] )

  puts "Taxonomy::Translation created"
  ap translation
}
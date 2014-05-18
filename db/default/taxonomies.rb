english_translations = YAML.load_file('config/locales/en.yml')
catalan_translations = YAML.load_file('config/locales/ca.yml')
spanish_translations = YAML.load_file('config/locales/es.yml')

taxonomy_translations = [
    { :default => (english_translations['en']['taxonomies']['categorias']),
      :catalan_name => (catalan_translations['ca']['taxonomies']['categorias']),
      :spanish_name => (spanish_translations['es']['taxonomies']['categorias'])
    },
    { :default => (english_translations['en']['taxonomies']['proveedor']),
      :catalan_name => (catalan_translations['ca']['taxonomies']['proveedor']),
      :spanish_name => (spanish_translations['es']['taxonomies']['proveedor'])
    }
]

taxonomy_translations.each { |translation|

  # Create Taxonomy
  taxonomy = Spree::Taxonomy.create!( :position => 0,
                                      :name => translation[:catalan_name] )

  # Add Taxonomy translations
  Spree::Taxonomy::Translation.find_or_create_by!( :spree_taxonomy_id => taxonomy.id,
                                                   :locale => 'ca',
                                                   :name => translation[:catalan_name] )


  Spree::Taxonomy::Translation.find_or_create_by!( :spree_taxonomy_id => taxonomy.id,
                                                   :locale => 'es',
                                                   :name => translation[:spanish_name] )
}
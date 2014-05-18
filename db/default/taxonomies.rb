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

  puts '--- TRANSLATION ----'
  ap translation

  taxonomy = Spree::Taxonomy.create!( :position => 0,
                                      :name => translation[:catalan_name] )

  puts '--- TAXONOMY CREATED ----'
  ap taxonomy

  catalan_attr= Spree::Taxonomy::Translation.find_or_create_by!( :spree_taxonomy_id => taxonomy.id,
                                                                 :locale => 'ca',
                                                                 :name => translation[:catalan_name] )

  puts '--- CATALAN ----'
  ap catalan_attr

  spanish_attr= Spree::Taxonomy::Translation.find_or_create_by!( :spree_taxonomy_id => taxonomy.id,
                                                                 :locale => 'es',
                                                                 :name => translation[:spanish_name] )

  puts '--- SPANISH ----'
  ap spanish_attr
}


#Spree::Admin::Taxonomy.update
#{"utf8"=>"✓",
# "authenticity_token"=>"wmdXLDqHkcZjZfEDTpD3jB7sW0lgt1Re7A1StMk6Y/I=",
# "taxonomy"=>{
#     "translations_attributes"=>{
#         "1"=>{
#             "id"=>"",
#             "locale"=>"en",
#             "name"=>""},
#         "2"=>{
#             "id"=>"1",
#             "locale"=>"es",
#             "name"=>"Categorias"},
#         "3"=>{
#             "id"=>"",
#             "locale"=>"ca",
#             "name"=>"Categories"}
#     }
# },
# "button"=>"", "id"=>"1"}
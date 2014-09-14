#load "#{Rails.root}/db/default/products.rb"

puts "Loading Taxons ..."

english_translations = YAML.load_file('config/locales/en.yml')
catalan_translations = YAML.load_file('config/locales/ca.yml')
spanish_translations = YAML.load_file('config/locales/es.yml')

taxonomy_categories = Spree::Taxonomy.find_by_name!(catalan_translations['ca']['taxonomies']['categorias'])
taxonomy_proveiders = Spree::Taxonomy.find_by_name!(catalan_translations['ca']['taxonomies']['proveedor'])

products = {
  :soca => english_translations['en']['products']['soca']['name'],
  :croscat => english_translations['en']['products']['croscat']['name'],
}


products.each do |key, name|
  products[key] = Spree::Product.find_by_name!(name)
end

taxons = [
  {
    :name => catalan_translations['ca']['taxons']['xai'],         # 'Carn de Xai'
    :catalan => catalan_translations['ca']['taxons']['xai'],
    :spanish =>  spanish_translations['es']['taxons']['xai'],
    :taxonomy => taxonomy_categories,
    :parent => taxonomy_categories.name,
    :position => 1,
    :products => []
  },
  {
    :name => catalan_translations['ca']['taxons']['vedella'],     # "Carn de Vedella",
    :catalan => catalan_translations['ca']['taxons']['vedella'],
    :spanish =>  spanish_translations['es']['taxons']['vedella'],
    :taxonomy => taxonomy_categories,
    :parent => taxonomy_categories.name,
    :position => 2,
    :products => []
  },
  {
    :name => catalan_translations['ca']['taxons']['porc'],        # "Porc",
    :taxonomy => taxonomy_categories,
    :parent => taxonomy_categories.name,
    :catalan => catalan_translations['ca']['taxons']['porc'],
    :spanish =>  spanish_translations['es']['taxons']['porc'],
    :products => []
  },
  {
    :name => catalan_translations['ca']['taxons']['ous_lactics'],  # "Ous i làctics",
    :catalan => catalan_translations['ca']['taxons']['ous_lactics'],
    :spanish =>  spanish_translations['es']['taxons']['ous_lactics'],
    :taxonomy => taxonomy_categories,
    :parent => taxonomy_categories.name,
    :position => 0,
    :products => []
  },
  {
    :name => catalan_translations['ca']['taxons']['pa'],          # "Pà",
    :catalan => catalan_translations['ca']['taxons']['pa'],
    :spanish => spanish_translations['es']['taxons']['pa'],
    :taxonomy => taxonomy_categories,
    :parent => taxonomy_categories.name,
    :position => 0,
    :products => [
      products[:soca],
      products[:croscat]
    ],
  },
  {
    :name => catalan_translations['ca']['taxons']['sot-palau'],   # "Sot del Palau",
    :catalan => catalan_translations['ca']['taxons']['sot-palau'],
    :spanish => spanish_translations['es']['taxons']['sot-palau'],
    :taxonomy => taxonomy_proveiders,
    :parent => taxonomy_proveiders.name,
    :products => []
  },
  {
    :name => catalan_translations['ca']['taxons']['mas-garet'],    # "Mas el Garet",
    :catalan => catalan_translations['ca']['taxons']['mas-garet'],
    :spanish => spanish_translations['es']['taxons']['mas-garet'],
    :taxonomy => taxonomy_proveiders,
    :parent => taxonomy_proveiders.name,
    :products => []
  },
  {
    :name => catalan_translations['ca']['taxons']['fogaina'],        # "La Fogaina",
    :catalan => catalan_translations['ca']['taxons']['fogaina'],
    :spanish => spanish_translations['es']['taxons']['fogaina'],
    :taxonomy => taxonomy_proveiders,
    :parent => taxonomy_proveiders.name,
    :products => [ products[:soca],
                   products[:croscat] ]
  },
  {
    :name => catalan_translations['ca']['taxons']['mas-claperol'],    # "Mas Claperol",
    :catalan => catalan_translations['ca']['taxons']['mas-claperol'],
    :spanish => spanish_translations['es']['taxons']['mas-claperol'],
    :taxonomy => taxonomy_proveiders,
    :parent => taxonomy_proveiders.name,
    :products => []
  }
]


taxons.each do |taxon|

  #Only create taxons that have a parent
  if taxon[:parent]
    parent_taxon = Spree::Taxon.find_by_name!(taxon[:parent])

    sub_taxon = Spree::Taxon.create!(:name => taxon[:name],
                                     :parent_id => parent_taxon.id,
                                     :taxonomy_id => parent_taxon.taxonomy_id,
                                     :products => taxon[:products])

    if taxon[:catalan] and taxon[:spanish]

      Spree::Taxon::Translation.find_or_create_by!(:spree_taxon_id => sub_taxon.id,
                                                   :locale => 'ca',
                                                   :name => taxon[:catalan])

      Spree::Taxon::Translation.find_or_create_by!(:spree_taxon_id => sub_taxon.id,
                                                   :locale => 'es',
                                                   :name => taxon[:spanish])
    end

  end

end
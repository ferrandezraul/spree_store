#load "#{Rails.root}/db/default/products.rb"

puts "Loading Taxons ..."

catalan_translations = YAML.load_file('config/locales/ca.yml')
spanish_translations = YAML.load_file('config/locales/es.yml')

taxonomy_categories = Spree::Taxonomy.find_by_name!(catalan_translations['ca']['taxonomies']['categorias'])
taxonomy_proveiders = Spree::Taxonomy.find_by_name!(catalan_translations['ca']['taxonomies']['proveedor'])

# Watch out that name has to match with product names
# cause Spree::Product.find_by_name! will be called afterwards
products = {
  :soca => "Soca",
  :croscat => "Croscat",
  :costella_talls => "Costella a talls",
  :tall_per_rostir => "Tall per rostir",
  :bistec => "Bistec",
  :filet => "Filet",
  :secret => "Secret",
  :pedacet => "Pedacet",
  :llom => "Llom",
  :cap_de_llom => "Cap de llom",
  :osos_espinada => "Ossos d'espinada",
  :cua => "Cua",
  :galtes => "Galtes",
  :fetge => "Fetge",
  :peu => "Peu",
  :peu_cuit => "Peu cuit",
  :llonzat => "Llonzat",
  :cansalada => "Cansalada",
  :carn_estofar => "Carn per estofar",
  :panxeta => "Panxeta",
  :botifarra => "Botifarra",
  :salsitxa => "Salsitxa",
  :carn_picada => "Carn picada",
  :hamburguesa => "Hamburguesa",
  :bull_ou_negre_blanc => "Bull d'ou, blanc, de fetge o negre",
  :botifarra_ou_negre_blanca => "Botifarra d'ou, blanca, de fetge o negre",
  :bull_cap => "Bull de cap",
  :fuet => "Fuet"
}

products.each do |key, name|
  products[key] = Spree::Product.find_by_name!(name)
end

taxons = [
  {
    :name => "Carn de Xai",
    :catalan => (catalan_translations['ca']['taxons']['xai']),
    :spanish =>  (spanish_translations['es']['taxons']['xai']),
    :taxonomy => taxonomy_categories,
    :parent => taxonomy_categories.name,
    :position => 1,
    :products => []
  },
  {
    :name => "Carn de Vedella",
    :catalan => (catalan_translations['ca']['taxons']['vedella']),
    :spanish =>  (spanish_translations['es']['taxons']['vedella']),
    :taxonomy => taxonomy_categories,
    :parent => taxonomy_categories.name,
    :position => 2,
    :products => []
  },
  {
    :name => "Carn de porc",
    :taxonomy => taxonomy_categories,
    :parent => taxonomy_categories.name,
    :catalan => (catalan_translations['ca']['taxons']['porc']),
    :spanish =>  (spanish_translations['es']['taxons']['porc']),
    :products => [ products[:costella_talls],
                   products[:tall_per_rostir],
                   products[:bistec],
                   products[:filet],
                   products[:secret],
                   products[:pedacet],
                   products[:llom],
                   products[:cap_de_llom],
                   products[:osos_espinada],
                   products[:cua],
                   products[:galtes],
                   products[:fetge],
                   products[:peu],
                   products[:peu_cuit],
                   products[:llonzat],
                   products[:cansalada],
                   products[:carn_estofar],
                   products[:panxeta],
                   products[:botifarra],
                   products[:salsitxa],
                   products[:carn_picada],
                   products[:hamburguesa],
                   products[:bull_ou_negre_blanc],
                   products[:botifarra_ou_negre_blanca],
                   products[:bull_cap],
                   products[:fuet] ]
  },
  {
    :name => "Ous i làctics",
    :catalan => (catalan_translations['ca']['taxons']['ous_lactics']),
    :spanish =>  (spanish_translations['es']['taxons']['ous_lactics']),
    :taxonomy => taxonomy_categories,
    :parent => taxonomy_categories.name,
    :position => 0,
    :products => []
  },
  {
    :name => "Pà",
    :catalan => (catalan_translations['ca']['taxons']['pa']),
    :spanish =>  (spanish_translations['es']['taxons']['pa']),
    :taxonomy => taxonomy_categories,
    :parent => taxonomy_categories.name,
    :position => 0,
    :products => []
  },
  {
    :name => "Sot del Palau",
    :catalan => (catalan_translations['ca']['taxons']['sot-palau']),
    :spanish =>  (spanish_translations['es']['taxons']['sot-palau']),
    :taxonomy => taxonomy_proveiders,
    :parent => taxonomy_proveiders.name,
    :products => []
  },
  {
    :name => "Mas el Garet",
    :catalan => (catalan_translations['ca']['taxons']['mas-garet']),
    :spanish =>  (spanish_translations['es']['taxons']['mas-garet']),
    :taxonomy => taxonomy_proveiders,
    :parent => taxonomy_proveiders.name,
    :products => []
  },
  {
    :name => "La Fogaina",
    :catalan => (catalan_translations['ca']['taxons']['fogaina']),
    :spanish =>  (spanish_translations['es']['taxons']['fogaina']),
    :taxonomy => taxonomy_proveiders,
    :parent => taxonomy_proveiders.name,
    :products => [ products[:soca],
                   products[:croscat] ]
  },
  {
    :name => "Mas Claperol",
    :catalan => (catalan_translations['ca']['taxons']['mas-claperol']),
    :spanish =>  (spanish_translations['es']['taxons']['mas-claperol']),
    :taxonomy => taxonomy_proveiders,
    :parent => taxonomy_proveiders.name,
    :products => []
  }
]

taxons.each do |taxon|

  #Only create taxons that have a parent
  if taxon[:parent]
    parent_taxon = Spree::Taxon::Translation::find_by_name!(taxon[:parent])

    sub_taxon = Spree::Taxon.create!(:name => taxon[:name],
                                     :parent_id => parent_taxon.id,
                                     #:taxonomy_id => parent_taxon.taxonomy_id,
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
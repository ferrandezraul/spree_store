english_translations = YAML.load_file('config/locales/en.yml')
catalan_translations = YAML.load_file('config/locales/ca.yml')
spanish_translations = YAML.load_file('config/locales/es.yml')

taxonomy_categories=(catalan_translations['ca']['taxonomies']['categorias'])
taxonomy_proveider=(catalan_translations['ca']['taxonomies']['proveedor'])

categories = Spree::Taxonomy.find_by_name!(taxonomy_categories)
proveiders = Spree::Taxonomy.find_by_name!(taxonomy_proveider)

#products = {
#  :ror_tote => "Ruby on Rails Tote",
#  :ror_bag => "Ruby on Rails Bag",
#  :ror_mug => "Ruby on Rails Mug",
#  :ror_stein => "Ruby on Rails Stein",
#  :ror_baseball_jersey => "Ruby on Rails Baseball Jersey",
#  :ror_jr_spaghetti => "Ruby on Rails Jr. Spaghetti",
#  :ror_ringer => "Ruby on Rails Ringer T-Shirt",
#  :spree_stein => "Spree Stein",
#  :spree_mug => "Spree Mug",
#  :spree_ringer => "Spree Ringer T-Shirt",
#  :spree_baseball_jersey =>  "Spree Baseball Jersey",
#  :spree_tote => "Spree Tote",
#  :spree_bag => "Spree Bag",
#  :spree_jr_spaghetti => "Spree Jr. Spaghetti",
#  :apache_baseball_jersey => "Apache Baseball Jersey",
#  :ruby_baseball_jersey => "Ruby Baseball Jersey",
#}


#products.each do |key, name|
#  products[key] = Spree::Product.find_by_name!(name)
#end

taxons = [
  {
    :name => "Carn de Xai",
    :catalan => (catalan_translations['ca']['taxons']['xai']),
    :spanish =>  (spanish_translations['es']['taxons']['xai']),
    :taxonomy => categories,
    :parent => "Categories",
    :position => 1,
    #:products => [
    #  products[:ror_tote],
    #  products[:ror_bag],
    #  products[:spree_tote],
    #  products[:spree_bag]
    #]
  },
  {
      :name => "Carn de Vedella",
      :catalan => (catalan_translations['ca']['taxons']['vedella']),
      :spanish =>  (spanish_translations['es']['taxons']['vedella']),
      :taxonomy => categories,
      :parent => "Categories",
      :position => 2,
      #:products => [
      #  products[:ror_mug],
      #  products[:ror_stein],
      #  products[:spree_stein],
      #  products[:spree_mug]
      #]
  },
  {
      :name => "Carn de porc",
      :taxonomy => categories,
      :parent => "Categories",
      :catalan => (catalan_translations['ca']['taxons']['porc']),
      :spanish =>  (spanish_translations['es']['taxons']['porc'])
  },
  {
      :name => "Ous i làctics",
      :catalan => (catalan_translations['ca']['taxons']['ous_lactics']),
      :spanish =>  (spanish_translations['es']['taxons']['ous_lactics']),
      :taxonomy => categories,
      :parent => "Categories",
      :position => 0,
      #:products => [
      #  products[:ror_jr_spaghetti],
      #  products[:spree_jr_spaghetti]
      #]
  },
  {
      :name => "Pà",
      :catalan => (catalan_translations['ca']['taxons']['pa']),
      :spanish =>  (spanish_translations['es']['taxons']['pa']),
      :taxonomy => categories,
      :parent => "Categories",
      :position => 0
      #:products => [
      #  products[:ror_baseball_jersey],
      #  products[:ror_ringer],
      #  products[:apache_baseball_jersey],
      #  products[:ruby_baseball_jersey],
      #  products[:spree_baseball_jersey],
      #  products[:spree_ringer]
      #],
  },
  {
      :name => "Sot del Palau",
      :catalan => (catalan_translations['ca']['taxons']['sot-palau']),
      :spanish =>  (spanish_translations['es']['taxons']['sot-palau']),
      :taxonomy => proveiders,
      :parent => "Proveïdors",
      #:products => [
      #  products[:ruby_baseball_jersey]
      #]
  },
  {
      :name => "Mas el Garet",
      :catalan => (catalan_translations['ca']['taxons']['mas-garet']),
      :spanish =>  (spanish_translations['es']['taxons']['mas-garet']),
      :taxonomy => proveiders,
      :parent => "Proveïdors"
      #:products => [
      #  products[:apache_baseball_jersey]
      #]
  },
  {
      :name => "La Fogaina",
      :catalan => (catalan_translations['ca']['taxons']['fogaina']),
      :spanish =>  (spanish_translations['es']['taxons']['fogaina']),
      :taxonomy => proveiders,
      :parent => "Proveïdors"
      #:products => [
      #  products[:spree_stein],
      #  products[:spree_mug],
      #  products[:spree_ringer],
      #  products[:spree_baseball_jersey],
      #  products[:spree_tote],
      #  products[:spree_bag],
      #  products[:spree_jr_spaghetti],
      #]
  },
  {
      :name => "Mas Claperol",
      :catalan => (catalan_translations['ca']['taxons']['mas-claperol']),
      :spanish =>  (spanish_translations['es']['taxons']['mas-claperol']),
      :taxonomy => proveiders,
      :parent => "Proveïdors"
      #:products => [
      #  products[:ror_tote],
      #  products[:ror_bag],
      #  products[:ror_mug],
      #  products[:ror_stein],
      #  products[:ror_baseball_jersey],
      #  products[:ror_jr_spaghetti],
      #  products[:ror_ringer],
      #]
  }
]


taxons.each do |taxon|

  #Only create taxons that have a parent
  if taxon[:parent]

    parent_taxon = Spree::Taxon.find_by_name!(taxon[:parent])

    sub_taxon = Spree::Taxon.create!(:name => taxon[:name],
                                     :parent_id => parent_taxon.id,
                                     :taxonomy_id => parent_taxon.taxonomy_id )

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
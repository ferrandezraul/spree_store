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
    :attr => {
      :name => "Carn de Xai",
      :taxonomy => categories,
      :parent => "Categories",
      :position => 1
      #:products => [
      #  products[:ror_tote],
      #  products[:ror_bag],
      #  products[:spree_tote],
      #  products[:spree_bag]
      #]
    },
    :translations => {
    :name => "Carn de Xai",
    :catalan => (catalan_translations['ca']['taxons']['xai']),
    :spanish =>  (spanish_translations['es']['taxons']['xai'])
    }
  },
  {
    :attr => {
      :name => "Carn de Vedella",
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
    :translations => {
      :name => "Carn de Vedella",
      :catalan => (catalan_translations['ca']['taxons']['vedella']),
      :spanish =>  (spanish_translations['es']['taxons']['vedella'])
    }
  },
  {
    :attr => {
      :name => "Carn de porc",
      :taxonomy => categories,
      :parent => "Categories"
    },
    :translations => {
      :name => "Carn de porc",
      :catalan => (catalan_translations['ca']['taxons']['porc']),
      :spanish =>  (spanish_translations['es']['taxons']['porc'])
    }
  },
  {
    :attr => {
      :name => "Ous i làctics",
      :taxonomy => categories,
      :parent => "Categories",
      :position => 0,
      #:products => [
      #  products[:ror_jr_spaghetti],
      #  products[:spree_jr_spaghetti]
      #]
    },
    :translations => {
      :name => "Ous i làctics",
      :catalan => (catalan_translations['ca']['taxons']['ous_lactics']),
      :spanish =>  (spanish_translations['es']['taxons']['ous_lactics'])
    }
  },
  {
    :attr => {
      :name => "Pà",
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
    :translations => {
      :name => "Pà",
      :catalan => (catalan_translations['ca']['taxons']['pa']),
      :spanish =>  (spanish_translations['es']['taxons']['pa'])
    }
  },
  {
    :attr => {
      :name => "Sot del Palau",
      :taxonomy => proveiders,
      :parent => "Proveïdors"
      #:products => [
      #  products[:ruby_baseball_jersey]
      #]
    },
    :translations => {
        :name => "Sot del Palau",
      :catalan => (catalan_translations['ca']['taxons']['sot-palau']),
      :spanish =>  (spanish_translations['es']['taxons']['sot-palau'])
    }
  },
  {
    :attr => {
      :name => "Mas el Garet",
      :taxonomy => proveiders,
      :parent => "Proveïdors"
      #:products => [
      #  products[:apache_baseball_jersey]
      #]
    },
    :translations => {
      :name => "Mas el Garet",
      :catalan => (catalan_translations['ca']['taxons']['mas-garet']),
      :spanish =>  (spanish_translations['es']['taxons']['mas-garet'])
    }
  },
  {
    :attr => {
      :name => "La Fogaina",
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
    :translations => {
      :name => "La Fogaina",
      :catalan => (catalan_translations['ca']['taxons']['fogaina']),
      :spanish =>  (spanish_translations['es']['taxons']['fogaina'])
    }
  },
  {
    :attr => {
      :name => "Mas Claperol",
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
    },
    :translations => {
      :name => "Mas Claperol",
      :catalan => (catalan_translations['ca']['taxons']['mas-claperol']),
      :spanish =>  (spanish_translations['es']['taxons']['mas-claperol'])
    }
  }
]


taxons.each do |taxon|

  if taxon[:attr]

    # Only create taxons that have a parent
    if taxon[:attr][:parent]

      parent_taxon = Spree::Taxon.find_by_name!(taxon[:attr][:parent])

      sub_taxon = Spree::Taxon.create!(:name => taxon[:attr][:name],
                                       :parent_id => parent_taxon.id,
                                       :taxonomy_id => parent_taxon.taxonomy_id )

      if taxon[:translations][:catalan] and taxon[:translations][:spanish]

        Spree::Taxon::Translation.find_or_create_by!(:spree_taxon_id => sub_taxon.id,
                                                     :locale => 'ca',
                                                     :name => taxon[:translations][:catalan])

        Spree::Taxon::Translation.find_or_create_by!(:spree_taxon_id => sub_taxon.id,
                                                     :locale => 'es',
                                                     :name => taxon[:translations][:spanish])
      end

    end

  end
end
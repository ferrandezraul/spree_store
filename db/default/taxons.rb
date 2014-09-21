#load "#{Rails.root}/db/default/products.rb"

puts "Loading Taxons ..."

my_taxons = TaxonCSV.read( "#{Rails.root}/db/taxons.csv")

my_taxons.each do |taxon|

  if taxon[:parent]
    parent_taxon = Spree::Taxon.find_by_name!(taxon[:parent])

    sub_taxon = Spree::Taxon.create!(:name => taxon[:name],
                                     :parent_id => parent_taxon.id,
                                     :taxonomy_id => parent_taxon.taxonomy_id,
                                     :products => taxon[:products])

    if taxon[:name] and taxon[:name_es]

      Spree::Taxon::Translation.find_or_create_by!(:spree_taxon_id => sub_taxon.id,
                                                   :locale => 'ca',
                                                   :name => taxon[:name])

      Spree::Taxon::Translation.find_or_create_by!(:spree_taxon_id => sub_taxon.id,
                                                   :locale => 'es',
                                                   :name => taxon[:name_es])
    end

  end

end
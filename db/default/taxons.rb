#load "#{Rails.root}/db/default/products.rb"

puts "Loading Taxons ..."

my_taxons = TaxonCSV.read( "#{Rails.root}/db/taxons.csv")

ap "\nAnd now my taxons"
ap my_taxons

my_taxons.each do |taxon|
  #Only create taxons that have a parent
  ap "\nT A X O N"
  ap taxon

  if taxon[:parent]
    ap "\nT A X O N PARENT"
    ap taxon[:parent]
    parent_taxon = Spree::Taxon.find_by_name!(taxon[:parent])

    ap "\nT A X O N PARENT FROM SPREE"
    ap parent_taxon

    sub_taxon = Spree::Taxon.create!(:name => taxon[:name],
                                     :parent_id => parent_taxon.id,
                                     :taxonomy_id => parent_taxon.taxonomy_id,
                                     :products => taxon[:products])

    ap "\nsub_taxon created"
    ap sub_taxon

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
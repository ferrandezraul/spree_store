require 'csv'

module Column
  NAME = 0               # Catalan name
  NAME_ES = 1            # Spanish name
  TAXONOMY = 2           # Taxonomy (Needs to be created before)
  POSITION = 3           # Position
  PRODUCTS = 4           # Tax Category (Needs to be created before)
end

class TaxonCSV
  #  Returns array of hashes with Taxon attributes
  #  = Example
  #  products = [
  #  {
  #    :name => "Carn de Xai",
  #    :name_en => "Carn de Xai",
  #    :name_es => "Carne de Cordero",
  #    :taxonomy => taxonomy,
  #    :parent => taxonomy.name,
  #    :position => 0,
  #    :products => []
  #  }
  #]
  def self.read( file_path )

    # By default separator is ","
    # CSV.read(file_path, { :col_sep => ';' })
    taxons = CSV.read(file_path)

    taxons = remove_headers(taxons)

    ap "\nMY TAXONS"
    ap taxons

    my_taxons = []
    taxons.each do |taxon|
      ap "\nTAXON"
      ap taxon
      taxonomy_category = taxonomy(taxon[Column::TAXONOMY])

      ap "\nMy Taxonomy"
      ap taxonomy_category

      products = []
      if taxon[Column::PRODUCTS]
        products << product(taxon[Column::PRODUCTS])
      end

      ap "\nMy Product"
      ap products

      my_taxons.push( { :name => taxon[Column::NAME],
                        :name_en => taxon[Column::NAME],
                        :name_es => taxon[Column::NAME_ES],
                        :taxonomy => taxonomy_category,
                        :parent => taxonomy_category.name,
                        :position => taxon[Column::POSITION].to_i,
                        :products => products } )
    end

    my_taxons

  end

  private

  def self.remove_headers(taxons)
    taxons_clean = []
    taxons.each do |taxon_attributes|
      # Filter headers. Note that it is assumed that headers start with '#'
      taxons_clean.push taxon_attributes unless taxon_attributes.first.starts_with?("#")
    end

    taxons = taxons_clean
  end

  def self.taxonomy(name)
    begin
      category = Spree::Taxonomy.find_by_name!(name)
    rescue ActiveRecord::RecordNotFound
      puts "Couldn't find #{name} Taxonomy."
      exit
    end

    category
  end

  def self.product(name)
    begin
      product = Spree::Product.find_by_name!(name)
    rescue ActiveRecord::RecordNotFound
      puts "Couldn't find #{name} Product."
      exit
    end

    product
  end

end
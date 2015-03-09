Spree::ProductsController.class_eval do

  def index
    # Copied from /.rvm/gems/ruby-2.1.1@ecocity_spree_2_2_stable/bundler/gems/spree-6aa500c4cade/frontend/app/controllers/spree/products_controller.rb
    @searcher = build_searcher(params.merge(include_images: true))
    @products = @searcher.retrieve_products
    @taxonomies = Spree::Taxonomy.includes(root: :children)

    # Add respond with csv format
    # Todo: create method @products.to_csv
    # http://railscasts.com/episodes/362-exporting-csv-and-excel
    respond_to do |format|
      format.html
      format.csv { render text: "hola;que;tal" }
    end

  end

end



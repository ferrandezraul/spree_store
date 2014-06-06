# Idea extracted from https://github.com/spree/spree_static_content

require 'cancan'
require_dependency 'spree/core/controller_helpers/strong_parameters'
require 'spree/i18n/initializer'

class Spree::StaticPagesController < Spree::BaseController
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  # include all helpers from spree_core/app/helpers
  helper 'spree/products'
  helper 'spree/store'
  helper 'spree/base'
  helper 'spree/taxons'
  helper 'spree/orders'

  def qui_som
  end

  def ecologico
  end

  def servicios
  end

  respond_to :html
end

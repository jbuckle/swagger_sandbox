class CatalogPresenter < Presenter
  include Grape::Entity::DSL

  typed_attribute :hits, Integer, 'Number of hits in this response set'
  typed_attribute :catalog_items, Array[CatalogItemPresenter], 'List of catalog items returned by this ES query'
end

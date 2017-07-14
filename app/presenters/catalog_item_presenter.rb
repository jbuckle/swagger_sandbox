class CatalogItemPresenter < Presenter
  include Grape::Entity::DSL

  typed_attribute :id, Integer, 'Database ID of this catalog item'
  typed_attribute :description, String, 'Description of this product'
  typed_attribute :variants, Array[VariantPresenter], 'List of Variants available for this CatalogItem'
  typed_attribute :default_variant_id, Integer, 'Database ID of the Variant that displays should default to presenting'
end

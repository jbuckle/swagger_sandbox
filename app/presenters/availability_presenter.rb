class AvailabilityPresenter < Presenter
  include Grape::Entity::DSL

  typed_attribute :id, Integer, 'Database id of the Item represented by this availability'
  typed_attribute :qty_left, Integer, 'Amount of this availability left in stock and available for sale'
  typed_attribute :price, Float, 'Price in USD of this product'
  typed_attribute :on_sale, Boolean, 'Whether or not this product is currently a sale price'
end

class VariantPresenter < Presenter
  include Grape::Entity::DSL

  typed_attribute :id, Integer, 'The database ID of this Variant'
  typed_attribute :pack_type, String, 'String representation of pack type'
  typed_attribute :pack_quantity, Integer, 'Number of containers in pack'
  typed_attribute :volume, Float, 'Volume of individual packs'
  typed_attribute :volume_units, String, 'Units to interpret field \'volume\' with'
  typed_attribute :availabilities, Array[AvailabilityPresenter], 'Items for sale associated with this Variant'
end

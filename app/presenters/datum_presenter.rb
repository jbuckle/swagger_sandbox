class DatumPresenter < Presenter
  include Grape::Entity::DSL

  typed_attribute :id, Integer, 'Id of this Datum'
  typed_attribute :errors, Array[ErrorPresenter], 'Some description'
end

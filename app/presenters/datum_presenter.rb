class DatumPresenter < Presenter
  include Grape::Entity::DSL

  will_attribute :id, Integer, 'Id of this Datum'
  will_attribute :errors, Array[ErrorPresenter], 'Some description'
end

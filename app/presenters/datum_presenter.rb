class DatumPresenter < Presenter
  expose_typed_attribute :id, Integer, { desc: 'The ID', type: 'Integer' }
  expose_typed_attribute :details, String, { desc: 'Details', type: 'String' }

  build_entity_definition!
end

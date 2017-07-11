class DatumPresenter < Grape::Entity
  expose :id, documentation: { type: 'Integer', description: 'A Datum' }
  expose :details, documentation: { type: 'String', description: 'Details' }
end

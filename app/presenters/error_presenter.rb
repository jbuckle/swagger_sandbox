class ErrorPresenter < Grape::Entity
  expose :status, documentation: { type: 'Integer', desc: 'HTTP Status Code' }
  expose :message, documentation: { type: 'String', desc: 'User friendly error message' }
end

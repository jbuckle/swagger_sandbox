class ErrorPresenter < Presenter
  include Grape::Entity::DSL

  typed_attribute :http_status, Integer, 'HTTP Status Code'
  typed_attribute :message, String, 'Human readable description of the error message'
end

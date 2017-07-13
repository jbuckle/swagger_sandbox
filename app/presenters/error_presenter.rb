class ErrorPresenter < Presenter
  include Grape::Entity::DSL

  will_attribute :http_status, Integer, 'HTTP Status Code'
  will_attribute :message, String, 'Human readable description of the error message'
end

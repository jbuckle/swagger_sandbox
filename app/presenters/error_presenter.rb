class ErrorPresenter < Presenter
  expose_typed_attribute :http_status, Integer, 'HTTP code associated with this error'
  expose_typed_attribute :message, String, 'The message associated with this error'
end

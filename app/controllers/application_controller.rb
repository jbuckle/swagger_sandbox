class ApplicationController < ActionController::API
  before_action :default_json_format

  private

    def default_json_format
      request.format = :json unless params[:format]
    end
end

class TestAPI < Grape::API
  format :json
  prefix :test

  desc 'Ask for some data' do
    detail 'Returns data based on the ID you passed.  Also takes a list of fields to filter the returned object with'
    success DatumPresenter::Entity
    failure [[404, 'Not Found', 'ErrorPresenter::Entity']]
  end

  params do
    requires :id, type: String, desc: 'ID of datum that you are requesting'
    optional :fields, type: Array[String], desc: 'Fields that you want'
    optional :success, type: Boolean, desc: 'Whether the request should succeed or not'
  end

  get :data do
    # SomeService that returns a context object here
    context = {
      data: DatumPresenter.new(id: 100, errors: [ErrorPresenter.new(http_status: 500, message: 'Bad bad not good')]),
      error: ErrorPresenter.new(http_status: 404, message: 'Not Found!'),
      success: params[:success]
    }

    context[:success] ? context[:data] : context[:error]
  end
end

class TestAPI < Grape::API
  format :json
  prefix :test

  desc 'Ask for some data' do
    detail 'Returns data based on the ID you passed.  Also takes a list of fields to filter the returned object with'
    success DatumPresenter
    failure [[404, 'Not Found', 'ErrorPresenter']]
  end

  params do
    requires :id, type: String, desc: 'ID of datum that you are requesting'
    optional :fields, type: Array[String], desc: 'Fields that you want'
  end

  get :data do
    e = DatumPresenter.new(id: 'doog', details: 'Returned')
    present e
  end
end

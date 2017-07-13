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
  end

  get :data do
    others = [DatumPresenter.new(id: params[:id].to_i + 100, details: 'Another', is_good: false)]
    DatumPresenter.new(id: params[:id], details: 'These are some example details', is_good: false, others: others)
  end
end

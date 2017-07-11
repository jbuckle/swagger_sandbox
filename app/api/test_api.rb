class TestAPI < Grape::API

  desc 'Ask for some data' do
    detail <<-doc
      Returns data based on the ID you passed.  Also takes a list of fields to filter the returned
      object with
    doc
    success DatumPresenter
    failure [[404, 'Not Found', 'ErrorPresenter']]
  end
  params do
    requires :id, type: String, desc: 'ID of datum that you are requesting'
    optional :fields, type: Array[String], desc: 'Fields that you want'
  end
  get :data do

  end
end

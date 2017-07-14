class TestAPI < Grape::API
  format :json
  prefix :test

  desc 'Fetch a dummy catalog response' do
    detail 'Also useful for seeing the schema outputted for a relatively nested response object'
    success CatalogPresenter::Entity
    failure [[401, 'Unauthorized', 'ErrorPresenter::Entity']]
  end

  params do
    optional :query_string, type: String, desc: 'Stringified JSON query to execute directly against the catalog'
    optional :hit_limit, type: Integer, desc: 'Maximum number of hits to return'
    optional :ignore_facets, type: Boolean, desc: 'Set to true to disable facet calculation (this makes everything much faster).'
  end

  get :catalog do

  end
end

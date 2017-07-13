class API < Grape::API
  format :json
  mount TestAPI
  add_swagger_documentation hide_documentation_path: true, api_version: 'v1', info: {
    title: 'Will\'s Test of Grape Swagger',
    description: "This is a test of latest grape-api, grape-entities, and grape-swagger working together to generate"\
      "a swagger UI API document.  Looking good!"
  }
end

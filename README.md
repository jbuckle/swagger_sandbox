# README

Sample application, exists to demo the presentation layer of V4 and the documentation
that that presentation layer would output.

## View Redoc Documentation

Start the rails server on port 3005 and navigate to localhost:3005/redoc_docs.

## View Swagger-UI documentation

Swagger-ui is unfortunately more of a pain to get started.  You have to clone the
swagger-ui project from github and then open the file ~/swagger-ui/dist/index.html
in your web browser.  With the rails server running, change the URL in the top
text input to be "http://localhost:3005/api/swagger_doc.json."  You should see the
docs for this project appear.

## View Presentation Layer

Presenters are inside app/presenters, and all subclass app/presenter/presenter.rb.

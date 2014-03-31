class App.Collections.Googles extends Backbone.Collection
  url: 'https://ajax.googleapis.com/ajax/services/search/web?v=1.0'

  model: App.Models.Google

  parse: (response) ->
    return response.responseData.results

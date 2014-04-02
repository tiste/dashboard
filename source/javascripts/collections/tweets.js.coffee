class App.Collections.Tweets extends Backbone.Collection
  url: 'http://backbone-dashboard.herokuapp.com/1.1/search/tweets.json'

  model: App.Models.Tweet

  parse: (response) ->
    return response.statuses

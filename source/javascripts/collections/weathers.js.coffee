class App.Collections.Weathers extends Backbone.Collection
  url: 'http://api.openweathermap.org/data/2.5/forecast/daily'

  model: App.Models.Weather

  comparator: (w) ->
    return w.get('date').getTime()

  parse: (response) ->
    items = response.list
    _.each items, (item) ->
      item.name = response.city.name

class App.Models.Weather extends Backbone.Model
  defaults:
    city: null
    date: null
    dateHTML: null
    icon: null
    tempDay: null
    tempMax: null
    tempMin: null
    text: null

  parse: (item) ->
    attrs           = {}
    attrs.city      = item.name
    attrs.date      = new Date(item.dt * 1000)
    attrs.dateHTML  = moment.unix(item.dt).lang('fr').format('dddd')
    attrs.icon      = item.weather[0].icon.slice(0, -1)
    attrs.tempDay   = item.temp.day.toFixed(1)
    attrs.tempMax   = item.temp.max.toFixed(1)
    attrs.tempMin   = item.temp.min.toFixed(1)
    attrs.text      = item.weather[0].description.charAt(0).toUpperCase() + item.weather[0].description.slice(1)
    attrs

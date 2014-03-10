window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  init: ->
    new App.Routers.Dashboard
    Backbone.history.start()

$(document).ready ->
  App.init()

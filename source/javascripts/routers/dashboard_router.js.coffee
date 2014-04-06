class App.Routers.Dashboard extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    window.App.Settings = new App.Models.Settings id: 1
    window.App.Settings.fetch()

    view = new App.Views.DashboardIndex
    $('#container').html(view.render().el)
    clock()

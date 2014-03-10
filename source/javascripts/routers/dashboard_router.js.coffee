class App.Routers.Dashboard extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    view = new App.Views.DashboardIndex
    $('#container').html(view.render().el)

class App.Views.DashboardIndex extends Backbone.View
  template: JST['templates/dashboard/index']

  loadWidgets: =>
    searchView    = new App.Views.GooglesIndex collection: new App.Collections.Googles()
    settingsView  = new App.Views.Settings model: window.App.Settings
    todos         = new App.Collections.Todos()
    weathers      = new App.Collections.Weathers()

    @$('.m-widget--google').html(searchView.render().el).find('.m-overlay--google').hide()
    @$('.m-widget--settings').html(settingsView.render().el)

    todos.fetch
      success: =>
        view = new App.Views.TodosIndex collection: todos
        @$('.m-widget--todo').html(view.render().el)

    weathers.fetch
      data:
        lang: window.App.Settings.get('lang')
        q: getCity()
        type: 'accurate'
        units: 'metric'
      dataType: 'jsonp'
      success: =>
        view = new App.Views.WeathersIndex collection: weathers
        @$('.m-widget--weather').html(view.render().el)
      error: =>
        setCity('Paris')
        @$('.m-widget--weather').html("<p class='lead text-center opacity'>La météo est vraiment mauvaise et ne veut pas s'afficher, veuillez recharger...</p>")

  render: =>
    $(@el).html(@template)
    @loadWidgets()
    @

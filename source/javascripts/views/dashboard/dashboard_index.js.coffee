class App.Views.DashboardIndex extends Backbone.View
  template: JST['templates/dashboard/index']

  loadWidgets: =>
    searchView    = new App.Views.GooglesIndex collection: new App.Collections.Googles()
    settingsView  = new App.Views.Settings model: window.App.Settings
    weathers      = new App.Collections.Weathers()

    @$('.m-widget--google').html(searchView.render().el).find('.m-overlay--google').hide()
    @$('.m-widget--settings').html(settingsView.render().el)

    weathers.fetch
      data:
        lang: window.App.Settings.get('lang')
        q: getCity()
        units: 'metric'
      dataType: 'jsonp'
      success: ->
        view = new App.Views.WeathersIndex collection: weathers
        @$('.m-widget--weather').html(view.render().el)

  render: =>
    $(@el).html(@template)
    @loadWidgets()
    @

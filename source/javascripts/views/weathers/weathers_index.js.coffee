class App.Views.WeathersIndex extends Backbone.View
  template: JST['templates/weathers/index']

  events:
    'blur .m-weather--input': 'refetch'
    'submit .m-weather form': 'refetch'

  initialize: ->
    @collection.on('reset', @render, this)

  refetch: (e) =>
    e.preventDefault()

    weathers = new App.Collections.Weathers()

    setCity @$('.m-weather--input').val()
    city = getCity()

    weathers.fetch
      data:
        lang: window.App.Settings.get('lang')
        q: city
        units: 'metric'
      dataType: 'jsonp'
      success: =>
        @collection = weathers
        setCity weathers.at(0).get('city')
        @render()
      error: =>
        setCity('Paris')
        goTo('/')

  render: =>
    $(@el).html(@template(weathers: @collection.toJSON()))
    @

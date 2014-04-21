class App.Views.WeathersIndex extends Backbone.View
  template: JST['templates/weathers/index']

  events:
    'blur .m-weather--input': 'refetch'
    'submit .m-weather form': 'refetch'

  initialize: ->
    @collection.on 'reset', @render, @

  refetch: (e) =>
    e.preventDefault()

    weathers = new App.Collections.Weathers()

    setCity @$('.m-weather--input').val()
    city = getCity()

    $(@$('.m-weather--item').get().reverse()).each (i) ->
      setTimeout(=>
        $(this).fadeOut()
      , i * 100)

    weathers.fetch
      data:
        lang: window.App.Settings.get('lang')
        lat: city.lat if city instanceof Object
        lon: city.lon if city instanceof Object
        q: city unless city instanceof Object
        type: 'accurate'
        units: 'metric'
      dataType: 'jsonp'
      success: =>
        @collection = weathers
        setCity weathers.at(0).get('city')
        @render()
      error: =>
        setGeoloc()
        @$('.m-weather').html("<p class='lead text-center opacity'>La météo est vraiment mauvaise et ne veut pas s'afficher, veuillez recharger...</p>")

  render: =>
    $(@el).html(@template(weathers: @collection.toJSON()))
    @$('.m-weather--item').hide().each (i) ->
      setTimeout(=>
        $(this).fadeIn()
      , i * 100)
    @

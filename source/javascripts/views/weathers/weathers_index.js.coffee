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
    @$('.m-weather--item').hide().each (i) ->
      setTimeout(=>
        $(this).fadeIn()
      , i * 100)
    @

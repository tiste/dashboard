class App.Views.WeathersIndex extends Backbone.View
  template: JST['templates/weathers/index']

  events:
    'blur .m-weather--city': 'refetch'
    'submit .m-weather form': 'refetch'

  initialize: ->
    @collection.on('reset', @render, this)

  refetch: (e) =>
    e.preventDefault()

    weathers  = new App.Collections.Weathers()
    city      = @$('.m-weather--city').val() || 'Paris'

    weathers.fetch
      data:
        q: city
        units: 'metric'
        lang: 'fr'
      dataType: 'jsonp'
      success: =>
        @collection = weathers
        @render()

  render: =>
    $(@el).html(@template(weathers: @collection.toJSON()))
    @

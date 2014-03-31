class App.Views.GooglesIndex extends Backbone.View
  template: JST['templates/googles/index']

  initialize: ->
    @collection.on('reset', @render, this)

  addAll: () =>
    @$('.m-search--results--list').html('')
    @collection.each(@addOne)

  addOne: (google) =>
    view = new App.Views.Google model: google
    @$('.m-search--results--list').append(view.render().el)

  render: =>
    $(@el).html(@template(collection: @collection))
    @addAll()
    @

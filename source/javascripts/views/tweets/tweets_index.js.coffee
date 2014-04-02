class App.Views.TweetsIndex extends Backbone.View
  template: JST['templates/tweets/index']

  initialize: ->
    @collection.on('reset', @render, this)

  addAll: =>
    @collection.each(@addOne)

  addOne: (tweet) =>
    view = new App.Views.Tweet model: tweet
    @$('.m-search--results--list').append(view.render().el)

  render: =>
    $(@el).html(@template(collection: @collection))
    @addAll()
    @

class App.Views.Google extends Backbone.View
  template: JST['templates/googles/google']

  tagName: 'li'

  render: ->
    $(@el).html(@template(@model.toJSON()))
    @

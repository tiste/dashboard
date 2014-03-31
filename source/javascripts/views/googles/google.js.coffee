class App.Views.Google extends Backbone.View
  template: JST['templates/googles/google']

  className: 'm-results--item'

  render: ->
    $(@el).html(@template(@model.toJSON()))
    @

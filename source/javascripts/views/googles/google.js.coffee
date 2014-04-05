class App.Views.Google extends Backbone.View
  template: JST['templates/googles/google']

  className: 'm-search--results--item'

  events:
    'click': 'redirect'

  redirect: ->
    goTo(@model.get('url'))

  render: =>
    $(@el).html(@template(@model.toJSON()))
    @

class App.Views.Tweet extends Backbone.View
  template: JST['templates/tweets/tweet']

  className: 'm-search--results--item'

  events:
    'click': 'redirect'

  redirect: ->
    goTo(@model.get('url'))

  render: ->
    $(@el).html(@template(@model.toJSON()))
    @

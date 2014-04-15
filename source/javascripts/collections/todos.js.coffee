class App.Collections.Todos extends Backbone.Collection
  model: App.Models.Todo

  localStorage: new Backbone.LocalStorage('dashboard')

  comparator: 'order'

  done: ->
    @where done: true

  nextPosition: ->
    return 1 unless @length
    return @last().get('order') + 1

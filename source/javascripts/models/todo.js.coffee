class App.Models.Todo extends Backbone.Model
  defaults:
    done: false
    order: 0
    title: null

  toggleDone: ->
    @save done: !@get('done')

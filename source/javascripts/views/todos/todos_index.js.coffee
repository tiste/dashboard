class App.Views.TodosIndex extends Backbone.View
  template: JST['templates/todos/index']

  initialize: ->
    @collection.on 'reset', @render, @
    @collection.on 'add', @addOne, @
    @collection.on 'all', @render, @

  events:
    'keypress .m-todo--new':  'createOnEnter'
    'click .m-todo--clear':   'clearCompleted'

  addAll: =>
    @collection.each(@addOne)

  addOne: (todo) =>
    view = new App.Views.Todo model: todo
    @$('.m-todo--list').append(view.render().el)

  clearCompleted: =>
    _.invoke @collection.done(), 'destroy'

  createOnEnter: (e) =>
    return if e.keyCode isnt 13
    return unless @$('.m-todo--new').val()

    @collection.create
      title: @$('.m-todo--new').val()
      order: @collection.nextPosition()

    @$('.m-todo--new').val ''

  render: =>
    $(@el).html(@template)
    @addAll()
    @

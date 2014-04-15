class App.Views.TodosIndex extends Backbone.View
  template: JST['templates/todos/index']

  className: 'm-todo'

  initialize: ->
    @collection.on 'reset', @render, @
    @collection.on 'add', @addOne, @
    @collection.on 'all', @render, @

  events:
    'keypress .m-todo--new':  'createOnEnter'
    'click .m-todo--clear':   'clearDone'

  addAll: =>
    @collection.each(@addOne)

  addOne: (todo) =>
    view = new App.Views.Todo model: todo
    @$('.m-todo--list').append(view.render().el)

  clearDone: =>
    _.invoke @collection.done(), 'destroy'

  countDone: ->
    done = @collection.done().length

    return "Effacer le rappel complété" if done is 1
    "Effacer les #{done} rappels complétés"

  createOnEnter: (e) =>
    return if e.keyCode isnt 13
    return unless @$('.m-todo--new').val()

    e.preventDefault()

    @collection.create
      title: @$('.m-todo--new').val()
      order: @collection.nextPosition()

    @$('.m-todo--new').val ''

  render: =>
    $(@el).html(@template)
    @$('.m-todo--clear').text(@countDone())
    @addAll()
    @

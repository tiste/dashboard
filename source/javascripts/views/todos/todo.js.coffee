class App.Views.Todo extends Backbone.View
  template: JST['templates/todos/todo']

  className: 'm-todo--item'

  tagName: 'li'

  initialize: ->
    @model.on 'change', @render, @
    @model.on 'destroy', @render, @

  events:
    'blur .m-todo--edit':     'update'
    'click .m-todo--destroy': 'clear'
    'click .m-todo--done':    'toggleDone'
    'click .m-todo--show':    'edit'
    'keypress .m-todo--edit': 'updateOnEnter'

  clear: =>
    @model.destroy()

  edit: =>
    $(@el).addClass 'editing'
    @$('.m-todo--edit').focus()

  update: _.debounce((e) ->
    title = @$('.m-todo--edit').val()

    unless title
      @clear()
    else
      @model.save title: title
      $(@el).removeClass 'editing'
  , 200)

  updateOnEnter: (e) =>
    if e.keyCode is 13
      e.preventDefault()
      @update()

  toggleDone: =>
    @model.toggleDone()

  render: =>
    $(@el).html(@template(@model.toJSON()))
    $(@el).toggleClass('done', @model.get('done'))
    @

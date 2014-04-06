class App.Views.Settings extends Backbone.View
  template: JST['templates/settings/settings']

  className: 'm-settings'

  initialize: ->
    @model.on('change', @render, this)

  events:
    'change #m-settings--background': 'setBackground'
    'change #m-settings--lang': 'setLang'
    'click .m-settings--icon': 'openSettings'
    'click .m-overlay--settings': 'closeSettings'

  closeSettings: (e) =>
    if e and $(e.target).hasClass('m-overlay--settings')
      @$('.m-overlay--settings').hide()
    else unless e
      @$('.m-overlay--settings').hide()

  openSettings: =>
    @$('.m-overlay--settings').show()

  setBackground: (e) =>
    fReader = new FileReader()
    file    = (if (e.dataTransfer is undefined) then e.target.files[0] else e.dataTransfer.files[0])

    fReader.readAsDataURL file
    fReader.onload = (e) =>
      @model.setBackground e.target.result
      @closeSettings()

  setLang: (e) =>
    @model.setLang @$('#m-settings--lang').val()
    goTo('/')

  render: ->
    $(@el).html(@template(@model.toJSON()))
    @closeSettings()
    @

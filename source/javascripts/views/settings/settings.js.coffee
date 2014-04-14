class App.Views.Settings extends Backbone.View
  template: JST['templates/settings/settings']

  className: 'm-settings'

  initialize: ->
    @model.on 'change', @render, @

  events:
    'change #m-settings--background':         'setBackground'
    'change #m-settings--lang':               'setLang'
    'change #m-settings--lang--weather':      'setWeatherLang'
    'click .m-overlay--settings':             'closeSettings'
    'click .m-settings--background--cancel':  'cancelBackground'
    'click .m-settings--help':                'openHelp'
    'click .m-settings--icon':                'openSettings'

  cancelBackground: =>
    @model.setBackground @model.defaults.background
    goTo('/')

  closeSettings: (e) =>
    if e and $(e.target).hasClass('m-overlay--settings')
      @$('.m-overlay--settings').hide()
    else unless e
      @$('.m-overlay--settings').hide()

  openHelp: =>
    @closeSettings()
    $('body').chardinJs('start')

  openSettings: =>
    @$('.m-overlay--settings').show()

  setBackground: (e) =>
    fReader = new FileReader()
    file    = (if (e.dataTransfer is undefined) then e.target.files[0] else e.dataTransfer.files[0])

    fReader.readAsDataURL file
    fReader.onload = (e) =>
      @model.setBackground e.target.result
      goTo('/')

  setLang: (e) =>
    @model.setLang @$('#m-settings--lang').val()
    goTo('/')

  setWeatherLang: (e) =>
    @model.setWeatherLang @$('#m-settings--lang--weather').val()
    goTo('/')

  render: ->
    $(@el).html(@template(@model.toJSON()))
    @closeSettings()
    @

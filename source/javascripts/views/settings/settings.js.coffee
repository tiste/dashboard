class App.Views.Settings extends Backbone.View
  template: JST['templates/settings/settings']

  className: 'm-settings'

  initialize: ->
    @model.on('change', @render, this)

  events:
    'change .m-settings--background': 'setBackground'

  setBackground: (e) =>
    fReader = new FileReader()
    file    = (if (e.dataTransfer is undefined) then e.target.files[0] else e.dataTransfer.files[0])

    fReader.readAsDataURL file
    fReader.onload = (e) =>
      @model.setBackground e.target.result

  render: ->
    $(@el).html(@template(@model.toJSON()))
    @

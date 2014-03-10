class App.Views.DashboardIndex extends Backbone.View
  template: JST['templates/dashboard/index']

  events:
    'keyup #search': 'search'

  initialize: ->
    _.bindAll this, 'displaySearch', 'search'
    $(document).bind 'keypress', @displaySearch

  displaySearch: (e) ->
    unless e.target.tagName.toLowerCase() is 'input'
      $('.m-overlay').show()
      $('#search').focus()

  render: ->
    $(@el).html(@template)
    @.$('.m-overlay').hide()
    @

  search: (e) ->
    if ($('#search').val() is '') or (e.keyCode is 27)
      $('.m-overlay').hide()
    else
      $('.m-overlay').show()

class App.Views.DashboardIndex extends Backbone.View
  template: JST['templates/dashboard/index']

  events:
    'keyup .m-search--input': (e) ->
      @isSearching(e)
      @search(e)

  initialize: ->
    $(document).bind 'keypress', @displaySearch

  displaySearch: (e) =>
    unless e.target.tagName.toLowerCase() is 'input'
      $('.m-overlay').show()
      $('.m-search--input').focus()

  isSearching: (e) =>
    if ($('.m-search--input').val() is '') or (e.keyCode is 27)
      $('.m-overlay').hide()
    else
      $('.m-overlay').show()

  render: =>
    $(@el).html(@template)
    @$('.m-overlay').hide()
    @

  search: (e) =>
    e.preventDefault()
    googles = new App.Collections.Googles()

    googles.fetch
      data:
        q: this.$('.m-search--input').val()
        rsz: 8
      dataType: 'jsonp'
      success: ->
        view = new App.Views.GooglesIndex collection: googles
        @$('.m-search--results').html(view.render().el)

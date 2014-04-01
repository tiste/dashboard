class App.Views.DashboardIndex extends Backbone.View
  template: JST['templates/dashboard/index']

  events:
    'keyup .m-search--input': (e) ->
      @isSearching(e)
      @search(e)
    'submit .m-search': 'search'

  initialize: ->
    $(document).bind 'keypress', @displaySearch

  displaySearch: (e) =>
    unless e.target.tagName.toLowerCase() is 'input'
      @$('.m-overlay').show()
      @$('.m-search--input').focus()

  isSearching: (e) =>
    if (@$('.m-search--input').val() is '') or (e.keyCode is 27)
      @$('.m-overlay').hide()
    else
      @$('.m-overlay').show()

      selected = @$('.m-search--results--item.selected')

      if e.keyCode is 40
        selected.removeClass('selected').next('.m-search--results--item').addClass('selected') if selected.next('.m-search--results--item').length > 0
      else if (e.keyCode is 38)
        selected.removeClass('selected').prev('.m-search--results--item').addClass('selected') if selected.prev('.m-search--results--item').length > 0

  render: =>
    $(@el).html(@template)
    @$('.m-overlay').hide()
    @

  search: (e) =>
    e.preventDefault()

    if e.keyCode is 13
      openUrl(@$('.selected .url').data('url'))
    else if (e.keyCode < 37 or e.keyCode > 40) and (e.keyCode isnt 27)
      googles = new App.Collections.Googles()

      googles.fetch
        data:
          hl: 'fr'
          q: @$('.m-search--input').val()
          rsz: 8
        dataType: 'jsonp'
        success: ->
          view = new App.Views.GooglesIndex collection: googles
          @$('.m-search--results').html(view.render().el)
          @$('.m-search--results--item').first().addClass('selected') unless $(@el).find('.selected').length > 0

class App.Views.DashboardIndex extends Backbone.View
  template: JST['templates/dashboard/index']

  events:
    'keyup .m-search--input': (e) ->
      @isSearching(e)
      @search(e)
    'submit .m-search': 'doSearch'

  initialize: ->
    _.bindAll @, 'search'
    $(document).bind 'keydown', @displaySearch

  displaySearch: (e) =>
    if isChar(e) && e.target.tagName.toLowerCase() isnt 'input'
      @$('.m-overlay--dashboard').show()
      @$('.m-search--input').focus()

  doSearch: (e) ->
    e.preventDefault()
    @$('.selected').click()

  isSearching: (e) =>
    if (!isChar(e) and @$('.m-search--input').val() is '') or (e.keyCode is 27)
      @$('.m-overlay--dashboard').hide()
    else
      @$('.m-overlay--dashboard').show()

      selected = @$('.m-search--results--item.selected')

      if selected.length > 0
        if e.keyCode is 40
          selected.removeClass('selected').next('.m-search--results--item').addClass('selected') if selected.next('.m-search--results--item').length > 0
        else if (e.keyCode is 38)
          selected.removeClass('selected').prev('.m-search--results--item').addClass('selected') if selected.prev('.m-search--results--item').length > 0

        newSelectedPosition = @$('.m-search--results--item.selected').position().top + @$('.m-search--results').scrollTop()
        @$('.m-search--results').stop().animate scrollTop: newSelectedPosition, 100

  loadWidgets: =>
    settingsView  = new App.Views.Settings model: window.App.Settings
    weathers      = new App.Collections.Weathers()

    @$('.m-widget--settings').html(settingsView.render().el)

    weathers.fetch
      data:
        lang: window.App.Settings.get('lang')
        q: getCity()
        units: 'metric'
      dataType: 'jsonp'
      success: ->
        view = new App.Views.WeathersIndex collection: weathers
        @$('.m-widget--weather').html(view.render().el)

  search: _.debounce((e) ->
    if (e.keyCode < 37 or e.keyCode > 40) and (e.keyCode isnt 13) and (e.keyCode isnt 27)
      googles = new App.Collections.Googles()

      googles.fetch
        data:
          hl: window.App.Settings.get('lang')
          q: @$('.m-search--input').val()
          rsz: 8
        dataType: 'jsonp'
        success: ->
          view = new App.Views.GooglesIndex collection: googles
          @$('.m-search--results').html(view.render().el)
          @$('.m-search--results--item').first().addClass('selected') unless $(@el).find('.selected').length > 0
  , 700)

  render: =>
    $(@el).html(@template)
    @$('.m-overlay--dashboard').hide()
    @loadWidgets()
    @

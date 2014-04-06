class App.Views.GooglesIndex extends Backbone.View
  template: JST['templates/googles/index']

  events:
    'click .m-overlay--google': 'closeSearch'
    'keyup .m-google--input': (e) ->
      @isSearching(e)
      @search(e)
    'submit .m-google': 'doSearch'

  initialize: ->
    @collection.on('reset', @render, this)
    _.bindAll @, 'search'
    $(document).bind 'keydown', @openSearch

  addAll: =>
    @collection.each(@addOne)

  addOne: (google) =>
    view = new App.Views.Google model: google
    @$('.m-google--search').append(view.render().el)

  closeSearch: (e) =>
    if e and $(e.target).hasClass('m-overlay--google')
      @$('.m-overlay--google').hide()
    else unless e
      @$('.m-overlay--google').hide()

  openSearch: (e) =>
    if isChar(e) && e.target.tagName.toLowerCase() isnt 'input'
      @$('.m-overlay--google').show()
      @$('.m-google--input').focus()

  doSearch: (e) ->
    e.preventDefault()
    @$('.selected').click()

  isSearching: (e) =>
    if (!isChar(e) and @$('.m-google--input').val() is '') or (e.keyCode is 27)
      @closeSearch()
    else
      @$('.m-overlay--google').show()

      selected = @$('.m-google--search--item.selected')

      if selected.length > 0
        if e.keyCode is 40
          selected.removeClass('selected').next('.m-google--search--item').addClass('selected') if selected.next('.m-google--search--item').length > 0
        else if (e.keyCode is 38)
          selected.removeClass('selected').prev('.m-google--search--item').addClass('selected') if selected.prev('.m-google--search--item').length > 0

        newSelectedPosition = @$('.m-google--search--item.selected').position().top + @$('.m-google--search').scrollTop()
        @$('.m-google--search').stop().animate scrollTop: newSelectedPosition, 100

  search: _.debounce((e) ->
    if (e.keyCode < 37 or e.keyCode > 40) and (e.keyCode isnt 13) and (e.keyCode isnt 27)
      googles = new App.Collections.Googles()

      googles.fetch
        data:
          hl: window.App.Settings.get('lang')
          q: @$('.m-google--input').val()
          rsz: 8
        dataType: 'jsonp'
        success: =>
          @collection = googles
          @$('.m-google--search').html('')
          @addAll()
          @$('.m-google--search--item').first().addClass('selected') unless $(@el).find('.selected').length > 0
  , 700)

  render: =>
    $(@el).html(@template)
    @addAll()
    @

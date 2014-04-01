class App.Models.Google extends Backbone.Model
  defaults:
    content: null
    title: null
    titleHtml: null
    url: null
    visibleUrl: null

  parse: (item) ->
    attrs             = {}
    attrs.content     = item.content
    attrs.title       = item.titleNoFormatting
    attrs.titleHtml   = item.title
    attrs.url         = decodeURIComponent(item.url)
    attrs.visibleUrl  = item.visibleUrl
    attrs

class App.Models.Google extends Backbone.Model
  defaults:
    content: null
    title: null
    url: null
    visibleUrl: null

  parse: (item) ->
    attrs             = {}
    attrs.content     = item.content
    attrs.title       = item.titleNoFormatting
    attrs.url         = item.url
    attrs.visibleUrl  = item.visibleUrl
    attrs

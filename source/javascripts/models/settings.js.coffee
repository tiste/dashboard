class App.Models.Settings extends Backbone.Model
  defaults:
    background: '/images/wallpaper.jpg'
    lang: 'fr'

  localStorage: new Backbone.LocalStorage('dashboard')

  setBackground: (background) =>
    @set('background', background)
    @save()
    @

  setLang: (lang) =>
    @set('lang', lang)
    setCity('Paris') if lang is 'fr'
    setCity('London') if lang is 'en'
    @save()
    @

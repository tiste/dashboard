class App.Models.Settings extends Backbone.Model
  defaults:
    background: '/images/wallpaper.jpg'
    lang: 'fr'
    weatherLang: 'fr'

  localStorage: new Backbone.LocalStorage('dashboard')

  setBackground: (background) =>
    @set('background', background)
    @save()
    @

  setLang: (lang) =>
    @set('lang', lang)
    @save()
    @

  setWeatherLang: (lang) =>
    @set('weatherLang', lang)
    @save()
    @

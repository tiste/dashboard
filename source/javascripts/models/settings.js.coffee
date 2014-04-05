class App.Models.Settings extends Backbone.Model
  defaults:
    background: null

  localStorage: new Backbone.LocalStorage('dashboard')

  setBackground: (background) =>
    @set('background', background)
    @save()
    @

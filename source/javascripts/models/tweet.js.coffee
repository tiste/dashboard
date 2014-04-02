class App.Models.Tweet extends Backbone.Model
  defaults:
    date: null
    name: null
    screenName: null
    text: null
    url: null

  parse: (item) ->
    attrs             = {}
    attrs.date        = @twitterDateToString(item.created_at)
    attrs.name        = item.user.name
    attrs.screenName  = item.user.screen_name
    attrs.text        = item.text
    attrs.url         = 'http://twitter.com/' + attrs.screenName + '/status/' + item.id_str
    attrs

  twitterDateToString: (date) ->
    tweetDate = new Date(Date.parse(date))
    userDate  = new Date()
    diff      = Math.floor((userDate - tweetDate) / 1000)

    return "à l'instant" if diff <= 1
    return diff + ' secondes' if diff < 20
    return "moins d'une minute" if diff < 60
    return '1 minute' if diff <= 90
    return Math.round(diff / 60) + ' minutes' if diff <= 3540
    return '1 heure' if diff <= 5400
    return Math.round(diff / 3600) + ' heures' if diff <= 86400
    return '1 jour' if diff <= 129600
    return Math.round(diff / 86400) + ' jours' if diff < 604800
    return '1 semaine' if diff <= 777600
    'le ' + system_date

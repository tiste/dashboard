@clock = ->
  nameday  = ''
  clock     = $('.m-widget--clock')

  d     = new Date()
  day   = ('0' + d.getDate()).slice -2
  month = ('0' + (d.getMonth() + 1)).slice -2
  year  = d.getFullYear()

  $.ajax
    dataType: 'jsonp'
    url: 'http://nameday.tiste.io/namedays/' + year + month + day + '.json'
    jsonpCallback: 'nameday'
    success: (data) ->
      gender  = ''
      i       = 0

      _(data).each (n) ->
        if (n.gender is 'm')
          gender = 'St'
        else if (n.gender is 'f')
          gender = 'Ste'
        else
          nameday = '' unless i > 0

        nameday += ' et ' if i > 0
        nameday += gender + ' ' + n.name
        i++

      nameday = '' if i == 0

    setInterval(->
      d = moment().lang(window.App.Settings.get('lang'))
      date = d.format('LLLL').split(' ')

      clock.html('<div class="m-clock--hour mtm mlm pull-left opacity-high">' + d.format('H:mm:ss') + '</div>')
      clock.append('<div class="m-clock--date mtl mrm pull-right text-right opacity-high">' + date[0] + ' ' + date[1] + ' ' + date[2] + '<br><small>' + nameday + '</small></div>')
    , 1000)

@getCity = ->
  if localStorage
    if localStorage['city']
      try
        city = JSON.parse localStorage['city']
      catch e
        city = localStorage['city']

      return localStorage['city'] + ',' + window.App.Settings.get('weatherLang') unless city instanceof Object
      return city

@goTo = (url) ->
  window.open(url, '_self')

@isChar = (e) ->
  (e.keyCode > 47 and e.keyCode < 58) or e.keyCode is 32 or (e.keyCode > 64 and e.keyCode < 91) or (e.keyCode > 95 and e.keyCode < 112) or (e.keyCode > 185 and e.keyCode < 193) or (e.keyCode > 218 and e.keyCode < 223)

@setCity = (city) ->
  if localStorage && city
    localStorage['city'] = city

@setGeoloc = ->
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition((position) ->
      setCity JSON.stringify { 'lat': position.coords.latitude, 'lon': position.coords.longitude }
    , ->
      setCity 'Paris'
    )
  else
    setCity 'Paris'

@shuffleColor = ->
  _(['green', 'blue', 'black', 'yellow', 'orange', 'red', 'gray']).shuffle()[0]

$(window).load ->
  BackgroundCheck.init
    targets: 'body'
    images: 'body'

  if localStorage
    unless localStorage['tips']
      localStorage['tips'] = true
      $('body').chardinJs('start')
  else
    alert 'Vous devez utiliser un navigateur récent tel que Google Chrome pour profiter au mieux de toutes les fonctionnalités'

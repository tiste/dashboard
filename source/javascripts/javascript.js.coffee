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

      clock.html('<div class="m-clock--hour pos-absolute opacity-high z-index--sm">' + d.format('H:mm:ss') + '</div>')
      clock.append('<div class="m-clock--date pos-absolute text-right opacity">' + date[0] + ' ' + date[1] + ' ' + date[2] + '<br><small>' + nameday + '</small></div>')
    , 1000)

@getCity = ->
  if localStorage
    if localStorage['city']
      return localStorage['city'] + ',' + window.App.Settings.get('weatherLang')

  'Paris,' + window.App.Settings.get('weatherLang')

@goTo = (url) ->
  window.open(url, '_self')

@isChar = (e) ->
  (e.keyCode > 47 and e.keyCode < 58) or e.keyCode is 32 or (e.keyCode > 64 and e.keyCode < 91) or (e.keyCode > 95 and e.keyCode < 112) or (e.keyCode > 185 and e.keyCode < 193) or (e.keyCode > 218 and e.keyCode < 223)

@setCity = (city) ->
  if localStorage && city
    localStorage['city'] = city

@shuffleColor = ->
  _(['green', 'blue', 'black', 'yellow', 'orange', 'red', 'gray']).shuffle()[0]

$(window).load ->
  if localStorage
    unless localStorage['tips']
      localStorage['tips'] = true
      $('body').chardinJs('start')
  else
    alert 'Vous devez utiliser un navigateur récent tel que Google Chrome pour profiter au mieux de toutes les fonctionnalités'

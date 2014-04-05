@goTo = (url) ->
  window.open(url, '_self')

@isChar = (e) ->
  (e.keyCode > 47 and e.keyCode < 58) or e.keyCode is 32 or (e.keyCode > 64 and e.keyCode < 91) or (e.keyCode > 95 and e.keyCode < 112) or (e.keyCode > 185 and e.keyCode < 193) or (e.keyCode > 218 and e.keyCode < 223)

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

      _.each data, (n) ->
        if (n.gender is 'm')
          gender = 'Saints'
        else if (n.gender is 'f')
          gender = 'Saintes'
        else
          nameday = '' unless i > 0

        nameday += ' et ' if i > 0
        nameday += gender + ' ' + n.name
        i++

      nameday = '' if i == 0

    setInterval(->
      date = moment().lang('fr')
      clock.html('<div class="m-clock--hour pos-absolute opacity-high">' + date.format('H:mm:ss') + '</div>')
      clock.append('<div class="m-clock--date pos-absolute text-right opacity">' + date.format('dddd Do MMMM') + '<br><small>' + nameday + '</small></div>')
    , 1000)

@setCity = (city) ->
  if localStorage && city
    localStorage['city'] = city

@getCity = ->
  if localStorage
    if localStorage['city']
      return localStorage['city'] + ',fr'

  'Paris,fr'

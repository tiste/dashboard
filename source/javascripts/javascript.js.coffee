@goTo = (url) ->
  window.open(url, '_self')

@isChar = (e) ->
  (e.keyCode > 47 and e.keyCode < 58) or e.keyCode is 32 or (e.keyCode > 64 and e.keyCode < 91) or (e.keyCode > 95 and e.keyCode < 112) or (e.keyCode > 185 and e.keyCode < 193) or (e.keyCode > 218 and e.keyCode < 223)

@clock = ->
  clock = $('.m-widget--clock')
  setInterval(->
    date = moment().lang('fr')
    clock.html('<span class="m-clock--hour">' + date.format('H:mm:ss') + '</span><br><span class="m-clock--date opacity">' + date.format('dddd Do MMMM') + '</span>')
  , 1000)

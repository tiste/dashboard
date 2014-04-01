@goTo = (url) ->
  window.open(url, '_self')

@isChar = (e) ->
  (e.keyCode > 47 and e.keyCode < 58) or e.keyCode is 32 or (e.keyCode > 64 and e.keyCode < 91) or (e.keyCode > 95 and e.keyCode < 112) or (e.keyCode > 185 and e.keyCode < 193) or (e.keyCode > 218 and e.keyCode < 223)

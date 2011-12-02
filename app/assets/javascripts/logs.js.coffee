unless location.pathname.match(/^\/workshops\/\d+\/logs/)
  return true

jQuery ($) ->
  ws = new WebSocket("ws://localhost:3000/stream/#{ivars['workshop'].hashtag.replace('#', '')}")
  ws.onmessage = (m) ->
    alert(m)

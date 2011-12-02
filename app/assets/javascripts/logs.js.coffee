if location.pathname.match(/^\/workshops\/\d+\/logs/)
  jQuery ($) ->
    ws = new WebSocket("ws://localhost:3000/stream/#{ivars['workshop'].hashtag.replace('#', '')}")
    ws.onmessage = (m) ->
      json = $.parseJSON(m.data)
      img = $('<img>').attr('src', json.user_icon_url)
      img.on 'load', ->
        $("#logs").prepend $("<div>").attr('class', 'log').append(img).append($('<p>').text(json.text))



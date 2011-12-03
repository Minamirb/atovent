if location.pathname.match(/^\/workshops\/\d+\/logs/)
  jQuery ($) ->
    $(".log_regist_button").live 'click', ->
      $("#id").val(@id)
      $("#new_page").get(0).submit()

    ws = new WebSocket("ws://localhost:3000/stream/#{ivars['workshop'].id}")
    ws.onmessage = (m) ->
      json = $.parseJSON(m.data)
      img = $('<img>').attr('src', json.user_icon_url)
      img.on 'load', ->
        $("#logs").prepend $("<div>").attr('class', 'log')
          .append(img)
          .append($('<p>').text(json.content))
          .append($("<div>").append($("<button>").text('保存').attr({type: 'button', class: "log_regist_button", id: json.id})))



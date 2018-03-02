App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
   # Called when there's incoming data on the websocket for this channel
    current_chatroom = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")
    if current_chatroom.length > 0
      current_chatroom.append(data.message)
    else
      $("[data-behavior='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']")
        .css("font-weight", "bold")
   

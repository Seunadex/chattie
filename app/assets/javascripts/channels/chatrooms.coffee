App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log data
   # Called when there's incoming data on the websocket for this channel
    current_chatroom = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")
    if current_chatroom.length > 0
      if document.hidden
        if $(".strike").length == 0
          current_chatroom.append("<div class='strike'><span>Unread messages</span></div>")
        if Notification.permission == "granted"
          new Notification(data.username, { body: data.body })
      else
        App.last_read.update(data.chatroom_id)
      
      current_chatroom.append("<div><strong>#{data.username}:</strong> #{data.body}</div>")
    else
      $("[data-behavior='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']")
        .attr("style": 'font-weight: bold; color: red')

  send_message: (chatroom_id, message) ->
    @perform "send_message", { chatroom_id: chatroom_id, body: message }
   

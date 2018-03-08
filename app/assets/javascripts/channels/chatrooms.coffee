formatTime = (date) ->
    hours = date.getHours()
    minutes = date.getMinutes()
    ampm = if hours >= 12 then 'PM' else 'AM'
    hours = hours % 12
    hours = if hours then hours else 12
    minutes = ('0' + minutes).slice(-2)
    formattedTime = hours + ':' + minutes + ' ' + ampm
    formattedTime

App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
   # Called when there's incoming data on the websocket for this channel
    current_chatroom = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")
    time = new Date(data.created_at)
    if current_chatroom.length > 0

      if document.hidden
        if $(".strike").length == 0
          current_chatroom.append("<div class='strike'><span>Unread messages</span></div>")
        if Notification.permission == "granted"
          new Notification(data.username, { body: data.body })
      else
        App.last_read.update(data.chatroom_id)
      
      current_chatroom.append("""
      <div class="message-container">
        <div class="message-owner">
          <strong>#{data.username}</strong>
          <span class="timestamp">#{formatTime(time)}</span>
        </div>
        <div class="message-content">#{data.body}</div>
      </div>
      """)
      messages_to_bottom = ->
        scroll = $('#message-wrapper')
        scroll.scrollTop(scroll.prop("scrollHeight"))
      messages_to_bottom()
    else
      $(".chatroom-#{data.chatroom_id}-span").removeClass('hide-badge').addClass('show-badge')
  send_message: (chatroom_id, message) ->
    @perform "send_message", { chatroom_id: chatroom_id, body: message }
  

   

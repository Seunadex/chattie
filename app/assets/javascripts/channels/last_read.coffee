App.last_read = App.cable.subscriptions.create "LastReadChannel",
  connected ->

  disconnected ->

  received: (data) ->


  update: (chatroom_id) ->
    @perform "update", { chatroom_id: chatroom_id }

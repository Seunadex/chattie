# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  messages_to_bottom = ->
    scroll = $('#message-wrapper')
    scroll.scrollTop(scroll.prop("scrollHeight"))
  messages_to_bottom()

  handleAccordionToggle = ->
    $('.accordion').unbind('click')
    $('.accordion').on 'click', ->
      @classList.toggle 'active'
      panel = @nextElementSibling
      if panel.style.maxHeight
        panel.style.maxHeight = null
      else
        panel.style.maxHeight = panel.scrollHeight + 'px'

  setInterval (->
    handleAccordionToggle()
  ), 1000


handleVisibilityChange = ->
  $strike = $(".strike")
  if $strike.length > 0
    chatroomId = $("[data-behavior='messages']").data("chatroom-id")
    App.last_read.update(chatroomId)
    $strike.remove()


$(document).on "turbolinks:load", ->
  $(document).on 'click', handleVisibilityChange

  $("#new_message").on "keypress", (event) ->
    if event && event.keyCode == 13 && !event.shiftKey
      event.preventDefault()
      $(this).submit()

  $("#new_message").on "submit", (event) ->
    event.preventDefault()
    chatroomId = $("[data-behavior='messages']").data("chatroom-id")
    body = $("#message_body")
    
    App.chatrooms.send_message(chatroomId, body.val())
    event.target.value = ''

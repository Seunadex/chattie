# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
getPinnedItems = (chatroomId) ->
  $.ajax
    url: "/chatrooms/#{chatroomId}/messages"
    type: "GET"
    # contentType: 'application/json;charset=utf-8'
    # dataType: 'json'
    success: (data) ->
      data
      $('.pinned-msg-count').text(data.length)
      # displayData()

# displayData = ->
#   console.log pinnedData.data
#   something = pinnedData.data.map (dat) ->
#     "<div class='pinned-msg'>
#       <span class='pin-head'></span>
#       <span class='pin-time'>#{dat.created_at}</span>
#       <p>#{dat.body}</p>
#     </div>"
#   seun = ''
#   seun += x for x in something
#   $('.pinnned').html seun

#   user = ''
#   user += y for y in pinnedData.user
#   $('.pin-head').html user

openSideBar = ->
  document.getElementById('channel-detail').style.flex = '1.1'

closeSideBar = ->
  document.getElementById('channel-detail').style.flex = '0'




handlePinClick = ->
  $('.pin-msg').click ->
    msgId = $(this).parent().attr('message-id')
    chatroomId = $('.message-container').attr('data-chatroom-id')
    self = this
    $.ajax
      url: "/chatrooms/#{chatroomId}/messages/#{msgId}"
      type: "PUT"
      success: ->
        $(self).find('i').toggleClass 'fa-red'
        $(self).parent().parent().toggleClass('show-pinned')
        $(self).parent().parent().find('p').toggleClass('visible')
        getPinnedItems(chatroomId)

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
      panel.style.maxHeight = (panel.scrollHeight + 100) + 'px'


handleVisibilityChange = ->
  $strike = $(".strike")
  if $strike.length > 0
    chatroomId = $("[data-behavior='messages']").data("chatroom-id")
    App.last_read.update(chatroomId)
    $strike.remove()

$(document).on "turbolinks:load", ->
  path = location.pathname.split('/')
  if Number(path[2])
    openSideBar()

  $('.fa-opener').click ->
    openSideBar()

  $('.fa-closer').click ->
    closeSideBar()

  handleAccordionToggle()
  handlePinClick()

  $('#purpose-panel').hover (->
    $('.hide-edit-btn').show()
    return
  ), ->
    $('.hide-edit-btn').hide()
    return

  $('.hide-edit-btn').click ->
    $('.purpose').hide()
    $('#purpose-form').show()
    $('#purpose-panel').css('max-height', '300px')

  $('.close-btn').click ->
    $('#purpose-form').hide()
    $('.purpose').show()

  $('.fa-color-star').click ->
    $('.fa-color-star').toggleClass 'fa-active'

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

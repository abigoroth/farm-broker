jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0
    messages_to_bottom = -> messages.scrollBottom(messages.prop("scrollHeight"))


App.messages = App.cable.subscriptions.create "MessagesChannel",
  collection: -> $("[data-channel='messages']")
  connected: ->
    # FIXME: While we wait for cable subscriptions to always be finalized before sending messages
    setTimeout =>
      @followCurrentChatRoom()
      @installPageChangeCallback()
    , 1000

  received: (data) ->
    @collection().append(data.message) unless @userIsCurrentUser(data.message)
    alert('new msg')
    messages_to_bottom()

  userIsCurrentUser: (message) ->
    $(message).attr('data-user-id') is $('meta[name=current-user]').attr('id')

  followCurrentChatRoom: ->
    if chatRoomId = @collection().data('chat-room-id')
      @perform 'follow', chat_room_id: chatRoomId
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'turbolinks:load', -> App.messages.followCurrentChatRoom()
      messages_to_bottom()

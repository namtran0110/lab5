App.messages = App.cable.subscriptions.create "MessagesChannel",
  connected: ->
    console.log("connected")
# Called when the subscription is ready for use on the server

  disconnected: ->
# Called when the subscription has been terminated by the server

  received: (data) ->
    console.log("client receives ", data)
    $(".messages").append(data.message)
# Called when there's incoming data on the websocket for this channel

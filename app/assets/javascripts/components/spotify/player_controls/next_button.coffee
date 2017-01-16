@NextButton = React.createClass

  next: ->
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: 'ws://192.168.0.41:6600/mopidy/ws/'
    )

    mopidy.connect()
    mopidy.on 'state:online', ->
      mopidy.playback.next()
    return

  render: ->
    React.DOM.button
      onClick: @next
      className: 'btn fa fa-step-forward fa-4'

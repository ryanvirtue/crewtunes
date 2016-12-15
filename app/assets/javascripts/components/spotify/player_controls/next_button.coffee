@NextButton = React.createClass

  next: ->
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: 'ws://localhost:6680/mopidy/ws/'
    )

    mopidy.connect()
    mopidy.on 'state:online', ->
      mopidy.playback.next()
    return

  render: ->
    React.DOM.button
      onClick: @next
      className: 'btn fa fa-step-forward fa-4'

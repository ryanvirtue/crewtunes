@PauseButton = React.createClass

  stop: ->
    mopidy = new Mopidy(
      autoConnect: false
      webSocketUrl: 'ws://localhost:6680/mopidy/ws/'
    )

    mopidy.connect()
    mopidy.on 'state:online', ->
      mopidy.playback.pause()
    return

  render: ->
    React.DOM.button
      onClick: @stop
      className: 'btn fa fa-pause fa-4'

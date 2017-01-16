@StopButton = React.createClass

  stop: ->
    mopidy = new Mopidy(
      autoConnect: false
      webSocketUrl: 'ws://192.168.0.41:6600/mopidy/ws/'
    )

    mopidy.connect()
    mopidy.on 'state:online', ->
      mopidy.playback.stop()
    return

  render: ->
    React.DOM.button
      onClick: @stop
      className: 'fa-stop fa-4'

@PauseButton = React.createClass

  stop: ->
    mopidy = new Mopidy(
      autoConnect: false
      webSocketUrl: "ws://#{gon.server_ip}:#{gon.server_port}/mopidy/ws/"
    )

    mopidy.connect()
    mopidy.on 'state:online', ->
      mopidy.playback.pause()
    return

  render: ->
    React.DOM.button
      onClick: @stop
      className: 'btn fa fa-pause fa-4'

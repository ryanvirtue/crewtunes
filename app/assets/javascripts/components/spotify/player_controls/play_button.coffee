@PlayButton = React.createClass

  play: ->
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: 'ws://192.168.0.41:6600/mopidy/ws/'
      callingConvention: 'by-position-or-by-name'
    )

    mopidy.connect()
    mopidy.on 'state:online', ->
      mopidy.playback.play(mopidy.playback.getCurrentTrack)
    return

  render: ->
    React.DOM.button
      className: 'btn fa fa-play fa-4'
      onClick: @play

@PlayButton = React.createClass

  play: ->
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: 'ws://localhost:6680/mopidy/ws/'
    )

    mopidy.connect()
    mopidy.on 'state:online', ->
      mopidy.playback.play(mopidy.playback.getCurrentTrack)
    return

  render: ->
    React.DOM.button
      className: 'btn fa fa-play fa-4'
      onClick: @play

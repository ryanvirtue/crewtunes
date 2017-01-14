@CurrentPlaying = React.createClass
  displayName: 'CurrentPlaying'

  getCurrentTrack: ->
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: 'ws://localhost:6680/mopidy/ws/'
    )

    mopidy.connect()
    mopidy.on 'state:online', ->
      mopidy.playback.getCurrentTlTrack({}) -> (data)
        console.log data
      return
    return

  render: ->
    @getCurrentTrack()
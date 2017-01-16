@CurrentPlaying = React.createClass
  displayName: 'CurrentPlaying'

  getInitialState: ->
    playing_title: ''
    playing_artist: ''
    playing_album: ''

  getCurrentTrack: ->
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: 'ws://192.168.0.41:6600/mopidy/ws/'
      callingConvention: 'by-position-or-by-name'
    )

    mopidy.connect()

    mopidy.on 'state:online', (->
      mopidy.playback.getCurrentTlTrack().done ((data) ->
        @setState
          playing_title: data.track.name
          playing_artist: data.track['artists'][0].name
          playing_album: data.track['album'].name
        return).bind(this)
      return).bind(this)

  render: ->
    window.setTimeout(@getCurrentTrack, 1000)
#    React.DOM.div null,
#      onLoad: @getCurrentTrack()
    React.DOM.div null,
      React.DOM.h5 null,
        @state.playing_title
      React.DOM.p null,
        @state.playing_artist
      React.DOM.p null,
        @state.playing_album
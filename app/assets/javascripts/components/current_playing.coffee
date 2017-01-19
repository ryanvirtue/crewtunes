@CurrentPlaying = React.createClass
  displayName: 'CurrentPlaying'

  getInitialState: ->
    playing_title: ''
    playing_artist: ''
    playing_album: ''
    playing_length: null
    playing_album_image: ''
    time_position: null

  componentDidMount: ->
    @getCurrentTrack()

  getCurrentTrack: ->
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: "ws://#{gon.server_ip}:#{gon.server_port}/mopidy/ws/"
    )

    mopidy.connect()

    mopidy.on 'state:online', (->
      mopidy.playback.getCurrentTlTrack().done ((data) ->
        if data
          @setState
            playing_title: data.track.name
            playing_album: data.track['album'].name
            playing_artist: data.track['artists'][0].name
            playing_length: data.track.length
        return).bind(this)

      mopidy.playback.getTimePosition().then ((data) ->
        @setState
          time_position: data
        return).bind(this)
      return).bind(this)

  render: ->
    React.DOM.div null,
      React.DOM.h5 null,
        @state.playing_title
      React.DOM.p null,
        @state.playing_artist
      React.DOM.p null,
        @state.playing_album
      React.createElement('TrackList')

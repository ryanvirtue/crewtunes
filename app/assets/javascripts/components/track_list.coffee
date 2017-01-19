@TrackList = React.createClass
  displayName: 'Tracklist'

  getInitialState: ->
    tracks: []

  componentDidMount: ->
    @getTrackList()

  getTrackList: ->
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: "ws://#{gon.server_ip}:#{gon.server_port}/mopidy/ws/"
    )
    mopidy.connect()

    mopidy.on 'state:online', (->
      mopidy.tracklist.getTlTracks().done ((data) ->
        if data.shift()
          @setState
            tracks: data
        return).bind(this)
      return).bind(this)

  render: ->

    React.DOM.div null,
      if @state.tracks.length > 0
        React.DOM.table
          className: 'tracks bordered striped'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null,
                'Track'
              React.DOM.th null,
                'Artist'
              React.DOM.th null,
                'Album'
          React.DOM.tbody null,
            for track, i in @state.tracks
              React.DOM.tr null,
                React.DOM.td null,
                  track['track']['name']
                React.DOM.td null,
                  track['track']['artists'][0]['name']
                React.DOM.td null,
                  track['track']['album']['name']
                React.DOM.td null,
                  React.DOM.div
                    className: 'player-action'
                    if @props.session
                      React.createElement RemoveButton,
                        className: 'btn-floating btn-large waves-effect waves-light'
                        tlid: track.tlid
      else
        React.DOM.p null,
          'No tracks are currently queued'

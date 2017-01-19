@SpotifySearchGrid = React.createClass
  displayName: 'SpotifySearchGrid'

  getInitialState: ->
    searchQuery: ''
    tracks: []
    artists: []
    albums: []

  handleChange: (e) ->
    @setState
      searchQuery: e.target.value

  handleKeyPress: (e) ->
    if e.key == "Enter"
      @fetchResults(@state.searchQuery)

  fetchResults: (q) ->
    $.ajax
      type: 'GET'
      dataType: 'JSON'
      url: 'https://api.spotify.com/v1/search?q=' + q + '&type=track,artist,album&limit=10'
      success: (data) =>
        @setState
          tracks: data.tracks.items
          artists: data.artists.items
          albums: data.albums.items
      error: (data) =>
        "ERROR!"

  render: ->
    React.DOM.div
      className: 'search'

      React.DOM.div
        className: 'player-controlls'
        React.DOM.div
          className: 'player-action'
          React.createElement PlayButton,
        React.DOM.div
          className: 'player-action'
          React.createElement PauseButton,
        React.DOM.div
          className: 'player-action'
          React.createElement NextButton,
        React.DOM.div
          className: 'player-action'
          React.createElement FlushButton,

      React.DOM.input
        type: 'text'
        onChange: @handleChange
        placeholder: 'Track, Artist, Album'
        onKeyPress: @handleKeyPress
      if @state.tracks.length > 0
          React.DOM.div
            className: 'fetch-tracks'
            React.DOM.h4 null,
              "Tracks"
            React.DOM.table
              className: 'tracks bordered striped'
              React.DOM.thead null,
                React.DOM.tr null,
                  React.DOM.th null,
                    "Art"
                  React.DOM.th null,
                    "Track"
                  React.DOM.th null,
                    "Artist"
                  React.DOM.th null,
                    "Album"
              React.DOM.tbody null,
                for track, i in @state.tracks
                  React.DOM.tr null,
                    React.DOM.td null,
                      React.DOM.img
                        src: track.album.images[2].url
                    React.DOM.td null,
                      track.name
                    React.DOM.td null,
                      track.artists[0].name
                    React.DOM.td null,
                      track.album.name
                    React.DOM.td null,
                      React.createElement AddButton,
                        uri: track.uri

        if @state.artists.length > 0
          React.DOM.div
            className: 'fetch-artists'
            React.DOM.h4 null,
              "Artists"
            React.DOM.table
              className: 'tracks bordered striped'
              React.DOM.thead null,
                React.DOM.tr null,
                  React.DOM.th null,
                    "Art"
                  React.DOM.th null,
                    "Name"
              React.DOM.tbody null,
                for artist, i in @state.artists
                  React.DOM.tr null,
                    React.DOM.td null,
                      if artist.images.length > 0
                        React.DOM.img
                          src: artist.images[2].url
                      else
                        "Artist image" #TODO Add placeholder image
                    React.DOM.td null,
                      artist.name

      if @state.albums.length > 0
        React.DOM.div
          className: 'fetch-albums'
          React.DOM.h4 null,
            "Albums"
          React.DOM.table
            className: 'tracks bordered striped'
            React.DOM.thead null,
              React.DOM.tr null,
                React.DOM.th null,
                  "Album Artwork"
                React.DOM.th null,
                  "Album Name"
            React.DOM.tbody null,
              for album, i in @state.albums
                React.DOM.tr null,
                  React.DOM.td null,
                    React.DOM.img
                      src: album.images[2].url
                  React.DOM.td null,
                    album.name

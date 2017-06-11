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
      headers: {"Authorization": "Bearer #{gon.access_token}"}
      success: (data) =>
        @setState
          tracks: data.tracks.items
          artists: data.artists.items
          albums: data.albums.items
      error: (data) =>
        console.log(data)

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
                  React.DOM.tr
                    key: track.id
                    React.DOM.td null,
                      React.DOM.img
                        src: track.album.images[2].url
                    React.DOM.td null,
                      track.name
                    React.DOM.td null,
                      React.DOM.a
                        href: "/artist/id:#{track.artists[0].id}/show/"
                        artist_id: track.artists[0].id
                        track.artists[0].name
                    React.DOM.td null,
                      track.album.name
                    React.DOM.td null,
                      React.createElement AddButton,
                        uri: track.uri
                        id: track.id
                        href: track.href
                        name: track.name
                        artist_spotify_id: track.artists[0].id
                        artist_spotify_uri: track.artists[0].uri
                        artist_spotify_href: track.artists[0].href
                        artist_name: track.artists[0].name

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
                  React.DOM.tr
                    key: artist.id
                    React.DOM.td null,
                      if artist.images.length > 0
                        React.DOM.img
                          src: artist.images[2].url
                          style: {width: '64px'}
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
                React.DOM.tr
                  key: album.id
                  React.DOM.td null,
                    React.DOM.img
                      src: album.images[2].url
                      style: {width: '64px'}
                  React.DOM.td null,
                    album.name

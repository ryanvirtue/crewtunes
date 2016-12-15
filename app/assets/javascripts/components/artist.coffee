@Artist = React.createClass
  displayName: 'Artist'

  getInitialState: ->
    artist_id: props.artist.id
    artist: @getArtistInfo()

  getArtistInfo: ->
    $.ajax
      type: 'GET'
      dataType: 'JSON'
      url: 'https://api.spotify.com/v1/artists/' + @state.artist_id
      success: (data) =>
        @setState
          artist: data
      error: (data) =>
        "ERROR!"

  render: ->

    React.DOM.div
      class: 'artist'
      React.DOM.h1
        @state.artist.name

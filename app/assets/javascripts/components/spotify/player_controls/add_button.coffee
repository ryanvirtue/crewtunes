@AddButton = React.createClass

  addTrack: ->
    uri = @props.uri
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: 'ws://localhost:6680/mopidy/ws/'
    )

    mopidy.connect()
    mopidy.on 'state:online', ->
      mopidy.library.lookup(uri).done (track) ->
        mopidy.tracklist.add([track[0]])
      return
    return

  render: ->
    React.DOM.button
      class: @props.class
      uri: @props.uri
      className: 'btn fa fa-plus fa-4'
      onClick: @addTrack


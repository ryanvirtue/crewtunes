@AddButton = React.createClass

  addTrack: ->
    uri = @props.uri
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: "ws://#{gon.server_ip}:#{gon.server_port}/mopidy/ws/"

    )

    mopidy.connect()
    mopidy.on 'state:online', ->
      mopidy.library.lookup(uri).done (track) ->
        mopidy.tracklist.add([track[0]])
        mopidy.tracklist.setConsume(true)
      return
    return

  render: ->
    React.DOM.div
      className: 'player-action'
      React.DOM.button
        className: @props.class
        uri: @props.uri
        className: 'waves-effect waves-dark btn fa fa-plus fa-4'
        onClick: @addTrack
        title: 'Add Track'

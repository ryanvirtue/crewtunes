@FlushButton = React.createClass

  flushTrack: ->
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: "ws://#{gon.server_ip}:#{gon.server_port}/mopidy/ws/"

    )

    mopidy.connect()
    mopidy.on 'state:online', ->
      mopidy.tracklist.clear()
    return

  render: ->
    React.DOM.button
      className: @props.class
      className: 'waves-effect waves-dark btn fa fa-times fa-4'
      onClick: @flushTrack
      title: 'Flush Play Queue'

@RemoveButton = React.createClass

  removeTrack: ->
    tlid = @props.tlid
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: "ws://#{gon.server_ip}:#{gon.server_port}/mopidy/ws/"
    )

    mopidy.connect()
    mopidy.on 'state:online', ->
      mopidy.tracklist.remove({tlid: [tlid]}).done ->
        $('.' + tlid).remove()
      return
    return

  render: ->
    React.DOM.button
      className: @props.class
      className: 'waves-effect waves-dark btn fa fa-times fa-4'
      onClick: @removeTrack
      title: 'Remove Track'

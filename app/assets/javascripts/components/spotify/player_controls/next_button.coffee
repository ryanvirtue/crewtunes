@NextButton = React.createClass

  next: ->
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: "ws://#{gon.server_ip}:#{gon.server_port}/mopidy/ws/"
    )

    mopidy.connect()
    mopidy.on 'state:online', ->
      mopidy.playback.next()
    return

  render: ->
    React.DOM.button
      onClick: @next
      className: 'waves-effect waves-dark btn fa fa-step-forward fa-4'
      title: 'Next Track'

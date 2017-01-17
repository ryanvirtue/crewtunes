@Tracklist = React.createClass
  displayName: 'Tracklist'

  getTracklist: ->
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: "ws://#{gon.server_ip}:#{gon.server_port}/mopidy/ws/"
    )

    mopidy.connect()

    mopidy.on 'state:online', ->
      mopidy.tracklist.getTracks().then (data) ->

      return
    return


  render: ->
    React.DOM.div null,
      @getTracklist()
      



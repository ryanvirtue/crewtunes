@Tracklist = React.createClass
  displayName: 'Tracklist'

  getTracklist: ->
    mopidy= new Mopidy(
      autoConnect: false
      webSocketUrl: 'ws://192.168.0.41:6600/mopidy/ws/'
    )

    mopidy.connect()

    mopidy.on 'state:online', ->
      mopidy.tracklist.getTracks().then (data) ->

      return
    return


  render: ->
    React.DOM.div null,
      @getTracklist()
      



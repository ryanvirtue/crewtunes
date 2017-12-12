# @PlayButton = React.createClass
#
#   play: ->
#     mopidy= new Mopidy(
#       autoConnect: false
#       webSocketUrl: "ws://#{gon.server_ip}:#{gon.server_port}/mopidy/ws/"
#     )
#
#     mopidy.connect()
#     mopidy.on 'state:online', ->
#       mopidy.playback.state
#     return
#
#   render: ->
#     React.DOM.button
#       className: 'waves-effect waves-dark btn'
#       onClick: @play
#       title: 'Play'

@AdminControls = React.createClass
  displayName: 'AdminControls'
  render: ->
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
        React.createElement FlushButton

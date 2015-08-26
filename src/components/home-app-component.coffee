m = require 'mithril'
NavComponent = require '../components/nav-component'

class Component
  render: ->
    m 'div', [
      NavComponent
      'Hello, Mithril!'
    ]

module.exports =
  controller: ->
    new Component()
  view: (c) ->
    c.render()

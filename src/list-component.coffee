m = require 'mithril'
ItemComponent = require './item-component'

class Component
  constructor: (attrs) ->
    @list = attrs.list

  render: ->
    m 'ul', @list.map (item) ->
      m 'li',
        m.component ItemComponent, { item }

module.exports =
  controller: (attrs) ->
    new Component(attrs)
  view: (c) ->
    c.render()

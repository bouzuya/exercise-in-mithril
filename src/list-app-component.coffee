m = require 'mithril'
ItemComponent = require './item-component'
ListComponent = require './list-component'
NavComponent = require './nav-component'

class Component
  constructor: (attrs) ->
    @list = [
      id: '1'
      value: 'value1'
    ,
      id: '2'
      value: 'value2'
    ]
    id = m.route.param 'id'
    @item = if id? then @list.filter((i) -> i.id is id)[0] else null

  render: ->
    m 'div', [
      NavComponent
      m.component ListComponent, { @list }
      m.component(ItemComponent, { @item }) if @item?
    ].filter (i) -> i?

module.exports =
  controller: (attrs) ->
    new Component(attrs)
  view: (c) ->
    c.render()

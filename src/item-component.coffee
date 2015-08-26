m = require 'mithril'

class Component
  constructor: (attrs) ->
    @item = attrs.item

  render: ->
    m 'div', [
      m 'span',
        m 'a[href=/#/items/' + @item.id + ']', @item.id
    ,
      ': '
    ,
      m 'span', @item.value
    ]

module.exports =
  controller: (attrs) ->
    new Component(attrs)
  view: (c) ->
    c.render()

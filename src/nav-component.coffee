m = require 'mithril'

class Component
  constructor: ->
    @list = [
      name: '/'
      url: '/#/'
    ,
      name: '/tasks'
      url: '/#/tasks'
    ,
      name: '/items'
      url: '/#/items'
    ]

  render: ->
    m 'ul', @list.map (i) ->
      m 'li',
        m 'a[href=' + i.url + ']', i.name

module.exports =
  controller: Component
  view: (c) ->
    c.render()

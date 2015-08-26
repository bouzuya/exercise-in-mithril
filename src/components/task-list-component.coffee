m = require 'mithril'

class Component
  constructor: (attrs) ->
    @tasks = attrs.tasks

  render: ->
    m 'table', @tasks.map (task, index) ->
      m 'tr', [
        m 'td', [
          m 'input[type=checkbox]',
            onclick: m.withAttr('checked', task.done)
            checked: task.done()
        ]
        m 'td', {
          style:
            textDecoration: if task.done() then 'line-through' else 'none'
        }, task.description()
      ]

module.exports =
  controller: (attrs) ->
    new Component(attrs)
  view: (c) ->
    c.render()

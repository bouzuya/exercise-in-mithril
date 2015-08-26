m = require 'mithril'

myComponent =
  controller: ->
  view: ->

# Model
class Task
  constructor: (data) ->
    @description = m.prop data.description
    @done = m.prop false

# Controller
class TaskController
  constructor: (attr, extra) ->
    @tasks = []
    @description = m.prop ''
    @add = @add.bind @

  add: ->
    description = @description()
    if description
      @tasks.push new Task { description }
      @description ''

class TaskListController
  constructor: (attrs) ->
    console.log attrs
    @tasks = attrs.tasks

TaskListComponent =
  controller: TaskListController
  view: (c) ->
    m 'table', c.tasks.map (task, index) ->
      m 'tr', [
        m 'td', [
          m 'input[type=checkbox]',
            onclick: m.withAttr('checked', task.done)
            checked: task.done()
        ]
      ,
        m 'td', {
          style:
            textDecoration: if task.done() then 'line-through' else 'none'
        }, task.description()
      ]

component =
  controller: TaskController
  view: (c) ->
    m 'html', [
      m 'body', [
        m 'input',
          # m.withAttr
          # onchange: (e) ->
          #   vm.description e.target['value']
          onchange: m.withAttr('value', c.description)
          value: c.description()
      ,
        m 'button', { onclick: c.add }, 'Add'
      ,
        m.component TaskListComponent, tasks: c.tasks
      ]
    ]

m.mount document, component
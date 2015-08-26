m = require 'mithril'
ListAppComponent = require './components/list-app-component'
NavComponent = require './components/nav-component'
Task = require './models/task'

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

AppComponent =
  controller: TaskController
  view: (c) ->
    m 'div', [
      NavComponent
    ,
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

HomeComponent =
  controller: ->
  view: (c) ->
    m 'div', [
      NavComponent
    ,
      'Hello, Mithril!'
    ]

m.route.mode = 'hash'

m.route document.body, '/',
  '/': HomeComponent
  '/tasks': AppComponent
  '/items': ListAppComponent
  '/items/:id': ListAppComponent

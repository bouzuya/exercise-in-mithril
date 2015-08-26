m = require 'mithril'
ListAppComponent = require './components/list-app-component'
NavComponent = require './components/nav-component'
TaskListComponent = require './components/task-list-component'
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

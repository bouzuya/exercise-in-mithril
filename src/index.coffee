m = require 'mithril'
ItemComponent = require './item-component'
NavComponent = require './nav-component'

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

ListComponent =
  controller: (attrs) ->
    list: attrs.list
  view: (c) ->
    m 'ul', c.list.map (i) ->
      m 'li',
        m.component ItemComponent, item: i

ListAppComponent =
  controller: ->
    list = [
      id: '1'
      value: 'value1'
    ,
      id: '2'
      value: 'value2'
    ]
    id = m.route.param 'id'
    item = if id? then list.filter((i) -> i.id is id)[0] else null
    { list, item }
  view: (c) ->
    m 'div', [
      NavComponent
    ,
      m.component ListComponent, list: c.list
    ,
      if c.item? then m.component ItemComponent, item: c.item else null
    ].filter (i) -> i?

m.route.mode = 'hash'

m.route document.body, '/',
  '/': HomeComponent
  '/tasks': AppComponent
  '/items': ListAppComponent
  '/items/:id': ListAppComponent

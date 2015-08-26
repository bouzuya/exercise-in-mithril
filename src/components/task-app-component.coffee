m = require 'mithril'
Task = require '../models/task'
NavComponent = require '../components/nav-component'
TaskListComponent = require '../components/task-list-component'

class Component
  constructor: ->
    @tasks = []
    @description = m.prop ''
    @add = @add.bind @

  add: ->
    description = @description()
    if description
      @tasks.push new Task { description }
      @description ''

  render: ->
    m 'div', [
      NavComponent
      m 'input',
        # m.withAttr
        # onchange: (e) ->
        #   vm.description e.target['value']
        onchange: m.withAttr('value', @description)
        value: @description()
      m 'button', { onclick: @add }, 'Add'
      m.component TaskListComponent, { @tasks }
    ]

module.exports =
  controller: ->
    new Component()
  view: (c) ->
    c.render()

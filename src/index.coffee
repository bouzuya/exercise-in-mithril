m = require 'mithril'
ListAppComponent = require './components/list-app-component'
NavComponent = require './components/nav-component'
TaskAppComponent = require './components/task-app-component'

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
  '/tasks': TaskAppComponent
  '/items': ListAppComponent
  '/items/:id': ListAppComponent

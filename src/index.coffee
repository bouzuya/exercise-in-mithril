m = require 'mithril'
HomeAppComponent = require './components/home-app-component'
ListAppComponent = require './components/list-app-component'
NavComponent = require './components/nav-component'
TaskAppComponent = require './components/task-app-component'

m.route.mode = 'hash'

m.route document.body, '/',
  '/': HomeAppComponent
  '/tasks': TaskAppComponent
  '/items': ListAppComponent
  '/items/:id': ListAppComponent

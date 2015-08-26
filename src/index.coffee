m = require 'mithril'
HomeAppComponent = require './components/home-app-component'
ListAppComponent = require './components/list-app-component'
TaskAppComponent = require './components/task-app-component'

m.route.mode = 'hash'

m.route document.body, '/',
  '/': HomeAppComponent
  '/items': ListAppComponent
  '/items/:id': ListAppComponent
  '/tasks': TaskAppComponent

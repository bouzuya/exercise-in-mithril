m = require 'mithril'

class Task
  constructor: (data) ->
    @description = m.prop data.description
    @done = m.prop false

module.exports = Task

module.exports =
  provider: null

  activate: ->

  deactivate: ->
    @provider = null

  provide: ->
    unless @provider?
      PatternProvider = require('./patternlab-provider')
      @provider = new PatternProvider()

    @provider

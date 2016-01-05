module.exports =
  provider: null

  activate: ->
    console.log('activate')

  deactivate: ->
    @provider = null

  provide: ->
    console.log('provide')
    unless @provider?
      PatternLabProvider = require('./patternlab-provider')
      @provider = new PatternLabProvider()

    @provider

module.exports =
class PatternProvider
  # This will work on Mustache files for now
  selector: '.source.mustache'

  # This will take priority over the default provider, which has a priority of 0.
  # `excludeLowerPriority` will suppress any providers with a lower priority
  # i.e. The default provider will be suppressed
  inclusionPriority: 1
  excludeLowerPriority: true
  suggestionPriority: 2

  constructor: ->
    console.log('creating provider')

  # Required: Return a promise, an array of suggestions, or null.
  getSuggestions: ({editor, bufferPosition, scopeDescriptor, prefix, activatedManually}) ->
    console.log('getting suggestions')
    prefix = @getPrefix(editor, bufferPosition)
    new Promise (resolve) ->
      suggestion =
        text: 'someText'
        replacementPrefix: '{{'
        displayText: 'WORKING?' # (optional)
      resolve([suggestion])


  getPrefix: (editor, bufferPosition) ->
    console.log('getPrefix')
    # Whatever your prefix regex might be
    regex = /{{/

    # Get the text for the line up to the triggered buffer position
    line = editor.getTextInRange([[bufferPosition.row, 0], bufferPosition])

    # Match the regex to the line, and return the match
    line.match(regex)?[0] or ''

  # (optional): called _after_ the suggestion `replacementPrefix` is replaced
  # by the suggestion `text` in the buffer
  onDidInsertSuggestion: ({editor, triggerPosition, suggestion}) ->

  # (optional): called when your provider needs to be cleaned up. Unsubscribe
  # from things, kill any processes, etc.
  dispose: ->

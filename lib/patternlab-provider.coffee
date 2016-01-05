class PatternLabProvider
  # This will work on Mustache files for now
  selector: '*'
  inclusionPriority: 2
  excludeLowerPriority: true

  constructor: ->
    console.log('creating provider')

  getSuggestions: ({editor, bufferPosition, scopeDescriptor, prefix}) ->
    console.log(editor)
    console.log(bufferPosition)
    console.log(scopeDescriptor)
    console.log(prefix)
    prefix = @getPrefix(editor, bufferPosition)
    console.log(prefix)

    new Promise (resolve) ->
      suggestion =
        text: '{{atoms-colors}}'
        replacementPrefix: prefix
        type: 'snippet'
        rightLabel: 'Pattern'
        displayText: 'Atoms Colors'
      resolve([suggestion])

  getPrefix: (editor, bufferPosition) ->
    # Whatever your prefix regex might be
    regex = /[{{]+$/

    # Get the text for the line up to the triggered buffer position
    line = editor.getTextInRange([[bufferPosition.row, 0], bufferPosition])

    # Match the regex to the line, and return the match
    line.match(regex)?[0] or ''

  onDidInsertSuggestion: ({editor, triggerPosition, suggestion}) ->
    editor.cursors[0].moveLeft(2)

  dispose: ->

  loadPatterns: ->
    console.log("load patterns")

module.exports = PatternLabProvider

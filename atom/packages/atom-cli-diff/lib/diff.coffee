DiffView = require "./diff-view"

module.exports =
  diffView: null

  activate: (state) ->
    atom.workspaceView.command 'diff:selected', => @diffView.selected()
    atom.workspaceView.command 'diff:clipboard', => @diffView.clipboard()
    if @diffView != null and @diffView.hasParent()
      @diffView.destroy()
    else
      @diffView = new DiffView(state)

  deactivate: ->

  serialize: ->
    diffViewState: @diffView.serialize()
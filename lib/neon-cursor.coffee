module.exports = neonCursor =
	config:
		cursorType:
			title: 'Cursor type'
			description: 'Change cursor type between a box and a bar cursor'
			type: 'string'
			default: 'bar'
			enum: [
				'bar'
				'box'
			]

	activate: () ->
		atom.workspace.observeTextEditors @init
		atom.config.onDidChange 'neon-cursor.cursorType', neonCursor.setCursorType

	setCursorType: () ->
		cursorType = atom.config.get 'neon-cursor.cursorType'

		for textEditor in atom.workspace.getTextEditors()
			textEditorView = atom.views.getView textEditor

			if textEditorView.shadowRoot
				classList = textEditorView.shadowRoot.querySelector('.cursors').classList

			if cursorType is 'bar'
				classList.add 'neon-cursor-bar'
			else
				classList.remove 'neon-cursor-bar'

	init: (textEditor) ->
		neonCursor.setCursorType()

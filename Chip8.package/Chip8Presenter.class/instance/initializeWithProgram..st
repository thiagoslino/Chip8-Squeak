initialize-release
initializeWithProgram: aProgram
	model := Chip8 program: aProgram.
	view := Chip8Morph newWithPresenter: self.

	model when: #needRedraw send: #changed to: view.

	view open
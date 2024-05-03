stepping and presenter
step
	self delay timesRepeat: [ self chip emulateCycle ].
	self chip needRedraw
			ifTrue: [
				self changed.
				self chip removeDrawFlag ].
stepping and presenter
step
	self delay timesRepeat: [ self chip emulateCycle ].
	self chip needRedraw
			ifTrue: [
				self repaint.
				self chip removeDrawFlag ].
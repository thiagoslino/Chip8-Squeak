stepping and presenter
step
	self delay timesRepeat: [ presenter emulateCycle ].
	"self chip needRedraw
			ifTrue: [
				self changed.
				self chip removeDrawFlag ]."
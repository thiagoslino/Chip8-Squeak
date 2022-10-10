drawing
repaint
	0 to: (self chip display size - 1) do: [ :i | | color |
		(self chip displayAt: i) = 0
			ifTrue: [ color := Color black ]
			ifFalse: [ color := Color white ].
			(self submorphs at:(i+1)) color: color ].
	self changed.
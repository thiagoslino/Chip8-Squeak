drawing
repaint
 ^ [ :aCanvas |
	0 to: (self chip display size - 1) do: [ :i | | color x y position |
		(self chip displayAt: i) = 0
			ifTrue: [ color := Color black ]
			ifFalse: [ color := Color white ].
			
			x := i  \\ 64.
			y := (i / 64) floor integerPart.
			position := (x * 10)@(y* 10).

			aCanvas fillRectangle: (position corner: (position + (10@10))) color: color ]].
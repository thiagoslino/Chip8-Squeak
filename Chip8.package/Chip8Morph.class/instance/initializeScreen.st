initialization
initializeScreen
	0 to: ((Chip8 displayWidth * Chip8 displayHeight)  - 1) do: [ :i | | x y position|
		x := i  \\ 64.
		y := (i / 64) floor integerPart.
		position := (x * 10)@(y* 10).
		self addMorphBack: (Morph newBounds: (position corner: (position + (10@10))) color: Color black) ].

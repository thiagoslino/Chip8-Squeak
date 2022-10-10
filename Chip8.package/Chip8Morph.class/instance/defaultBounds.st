initialization
defaultBounds
	"answer the default bounds for the receiver"
	^ 0 @ 0 corner: (Chip8 displayWidth * 10)@(Chip8 displayHeight * 10).
as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	"DXYN: Draw a sprite (X, Y) size (8, N). Sprite is located at I"
	| x y height |
	x := aChip8 registerAt: (self opcodeX: anHexOperationCode).
	y := aChip8 registerAt: (self opcodeY: anHexOperationCode).
	height := anHexOperationCode bitAnd: 16r000F.
	aChip8 registerAt: 16rF put: 0.
	
	0 to: (height-1) do: [ :yLine | | pixel | 
		pixel := aChip8 memoryAt: yLine. 
		0 to: 7 do: [ :xLine | 
			(pixel bitAnd: (16r80 bitShift: xLine negated)) ~=  0 
				ifTrue: [ 
					| index |
					index := x + xLine + ( y + yLine * 64).
					index < (aChip8 display size)
						ifTrue: [
							(aChip8 displayAt: (index)) = 1
								ifTrue: [  aChip8 registerAt: 16rF put: 1 ].
							aChip8 displayAt: index put: ((aChip8 displayAt: index) bitXor: 1) ]	]		
		]
	].

	aChip8 incrementPC.
	aChip8 addDrawFlag.
as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	| x ex9e exa1 key |
	ex9e := 16r009E.
	exa1 := 16r00A1.
	x := self opcodeX: anHexOperationCode.
	key := aChip8 registerAt: x.
	aChip8 incrementPC.
	
	(self opcodeNN: anHexOperationCode ) = ex9e 
		ifTrue:[
			"EX9E Skip the next instruction if the Key VX is pressed"
			(aChip8 keyAt: key) = 1
				ifTrue: [ aChip8 incrementPC. ]
		].
	
	(self opcodeNN: anHexOperationCode ) = exa1 
		ifTrue:[
			"EXA1 Skip the next instruction if the Key VX is NOT pressed"
			(aChip8 keyAt: key) = 0
				ifTrue: [ aChip8 incrementPC. ]
		].
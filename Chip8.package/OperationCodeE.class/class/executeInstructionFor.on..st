as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	| x nn key |
	nn := self opcodeNN: anHexOperationCode.
	x := self opcodeX: anHexOperationCode.
	key := aChip8 registerAt: x.
	aChip8 incrementPC.
	
	nn = 16r009E 
		ifTrue:[
			"EX9E Skip the next instruction if the Key VX is pressed"
			(aChip8 keyAt: key) = 1
				ifTrue: [ aChip8 incrementPC. ]
		].
	
	nn = 16r00A1 
		ifTrue:[
			"EXA1 Skip the next instruction if the Key VX is NOT pressed"
			(aChip8 keyAt: key) = 0
				ifTrue: [ aChip8 incrementPC. ]
		].
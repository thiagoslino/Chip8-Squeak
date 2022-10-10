as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	"5XY0 Skips the next instruction if VX equals VY"
	| x y | 
	x := self opcodeX: anHexOperationCode.
	y := self opcodeY: anHexOperationCode.
	aChip8  incrementPC.
	
	(aChip8 registerAt: x) = (aChip8 registerAt: y)
		ifTrue: [ aChip8  incrementPC ]
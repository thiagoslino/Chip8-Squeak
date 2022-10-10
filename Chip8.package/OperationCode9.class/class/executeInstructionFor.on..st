as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	"9XY0 Skips the next instruction if VX doesn't equal VY"
	| x y |
	x := self opcodeX: anHexOperationCode.
	y := self opcodeY: anHexOperationCode.
	aChip8  incrementPC.
	
	(aChip8 registerAt: x) ~= (aChip8 registerAt: y)
		ifTrue: [ aChip8  incrementPC ]
as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	"4XNN: Skip the next instruction if VX != NN"
	| x nn |
	x := self opcodeX: anHexOperationCode.
	nn := self opcodeNN: anHexOperationCode .
	aChip8  incrementPC.
	(aChip8 registerAt: x)  ~= nn
		ifTrue: [ aChip8  incrementPC ]
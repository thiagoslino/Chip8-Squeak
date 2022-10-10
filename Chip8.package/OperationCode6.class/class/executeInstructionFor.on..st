as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	"6XNN: Set VX to NN"
	| vx nn |
	vx := self opcodeX: anHexOperationCode.
	nn := self opcodeNN: anHexOperationCode.
	aChip8 registerAt: vx  put: nn.
	aChip8  incrementPC.
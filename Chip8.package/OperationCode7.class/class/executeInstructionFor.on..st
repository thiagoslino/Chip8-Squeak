as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	"7XNN: Adds NN to VX"
	| x nn valueAtX|
	x := self opcodeX: anHexOperationCode.
	nn := self opcodeNN: anHexOperationCode.
	valueAtX := aChip8 registerAt: x.
	aChip8 registerAt: x put: (valueAtX  + nn).
	aChip8 incrementPC.
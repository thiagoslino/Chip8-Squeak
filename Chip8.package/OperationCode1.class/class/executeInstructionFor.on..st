as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	"1NNN: Jumps to address NNN"
	aChip8 pc: (self opcodeNNN:anHexOperationCode).
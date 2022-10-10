as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	"ANNN: Set I to NNN"
	aChip8 i: (self opcodeNNN:anHexOperationCode).
	aChip8 incrementPC.
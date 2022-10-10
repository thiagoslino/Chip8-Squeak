as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	"2NNN: Calls subroutine at NNN"
	aChip8 stackAt: (aChip8 sp) put: aChip8 pc.
	aChip8 incrementSP.
	aChip8 pc: (self opcodeNNN:anHexOperationCode).
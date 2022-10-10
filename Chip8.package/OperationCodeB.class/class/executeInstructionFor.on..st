as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	"BNNN Jumps to the address NNN plus V0."
	| nnn extra |
	nnn := self opcodeNNN: anHexOperationCode.
	extra := aChip8 registerAt: 0.
	aChip8 pc: nnn  + extra.
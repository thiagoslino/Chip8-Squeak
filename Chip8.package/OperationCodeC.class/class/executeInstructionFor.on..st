as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	"CXNN: Set VX to a random number and NN."
	| x nn randomNumber |
	x := self opcodeX: anHexOperationCode.
	nn := self opcodeNN: anHexOperationCode.
	randomNumber := (16rFF atRandom) bitAnd: nn.
	aChip8 registerAt: x put: randomNumber.
	aChip8 incrementPC.
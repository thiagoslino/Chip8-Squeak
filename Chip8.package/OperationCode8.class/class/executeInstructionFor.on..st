as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	| x y opcode |
	x := self opcodeX: anHexOperationCode.
	y := self opcodeY: anHexOperationCode.
	aChip8 incrementPC.
	opcode := anHexOperationCode bitAnd: 16r000F.

	opcode = 16r0
		ifTrue: [
			"8XY0: Sets VX to the value of VY"
			aChip8 registerAt: x put: (aChip8 registerAt: y).		
		]. 	

	opcode = 16r1
		ifTrue: [
			"Sets VX to VX or VY."
			aChip8 registerAt: x put: ((aChip8 registerAt: x) bitOr: (aChip8 registerAt: y)).
		]. 
	
	opcode = 16r2
		ifTrue: [
			"8XY2: Sets VX to VX and VY."
			aChip8 registerAt: x put: ((aChip8 registerAt: x) bitAnd: (aChip8 registerAt: y)).
		]. 
	
	opcode = 16r3
		ifTrue: [
			"8XY3 Sets VX to VX xor VY."
			aChip8 registerAt: x put: ((aChip8 registerAt: x) bitXor: (aChip8 registerAt: y)).
		]. 

	opcode = 16r4
		ifTrue: [
			"8XY4: Adds VY to VX. VF is set to 1 when there's a carry, and to 0 when there isn't."
			| result |
			result :=  (aChip8 registerAt: x) + (aChip8 registerAt: y).

			((aChip8 registerAt: y) > (16rFF - (aChip8 registerAt: x)))
				ifTrue: [ "carry"
					aChip8 registerAt: 16rF put: 1 ]
				ifFalse: [ "NOT carry"
					aChip8 registerAt: 16rF put: 0 ].
			aChip8 registerAt: x put: result.
		].
	
	opcode = 16r5
		ifTrue: [
			"VY is subtracted from VX. VF is set to 0 when there's a borrow, and 1 when there isn't."
			| result |
			result :=  (aChip8 registerAt: x) - (aChip8 registerAt: y).
			(result < 0)
				ifTrue: [ "Borrow"
					aChip8 registerAt: 16rF put: 0 ]
				ifFalse: [ "no borrow"
					aChip8 registerAt: 16rF put: 1 ].
			aChip8 registerAt: x put: result.
		].
	
	opcode = 16r6
		ifTrue: [
			"Shifts VX right by one. VF is set to the value of the least significant bit of VX before the shift."
			aChip8 registerAt: 16rF put: ((aChip8 registerAt: x) bitAnd: 16r1).
			aChip8 registerAt: x put: ((aChip8 registerAt: x) bitShift: -1).
		].	
	
	opcode = 16r7
		ifTrue: [
			"Sets VX to VY minus VX. VF is set to 0 when there's a borrow, and 1 when there isn't."
			| result |
			result :=  (aChip8 registerAt: y) - (aChip8 registerAt: x).
			(result < 0)
				ifTrue: [ aChip8 registerAt: 16rF put: 0. ]
				ifFalse: [ aChip8 registerAt: 16rF put: 1. ].
			aChip8 registerAt: x put: result.
		].	
	
	opcode = 16rE
		ifTrue: [
			"Shifts VX left by one. VF is set to the value of the most significant bit of VX before the shift"
			aChip8 registerAt: 16rF put: ((aChip8 registerAt: x) bitAnd: 16r80).
			aChip8 registerAt: x put: ((aChip8 registerAt: x) bitShift:1).
		].
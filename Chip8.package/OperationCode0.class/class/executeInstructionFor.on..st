as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	| nn |
	nn := self opcodeNN: anHexOperationCode.
	
	nn = 16r00E0 
		ifTrue:[
			"Clear the display"
			aChip8 clearDisplay.
			aChip8 incrementPC.
			aChip8 addDrawFlag.
		].
	
	nn = 16r00EE 
		ifTrue:[
			"Return from subroutine."
			aChip8 stackAt: (aChip8 sp) put: nil. "review"
			aChip8 decrementSP.
			aChip8 pc: (aChip8 stackAt: (aChip8 sp)) + 2.
		]
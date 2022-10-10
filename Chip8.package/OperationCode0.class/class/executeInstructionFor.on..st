as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	| e0 ee |
	e0 := 16r00E0.
	ee := 16r00EE.
	
	(self opcodeNN: anHexOperationCode ) = e0 
		ifTrue:[
			"Clear the display"
			aChip8 clearDisplay.
			aChip8 incrementPC.
			aChip8 addDrawFlag.
		].
	
	(self opcodeNN: anHexOperationCode ) = ee 
		ifTrue:[
			"Return from subroutine."
			aChip8 stackAt: (aChip8 sp) put: nil. "review"
			aChip8 decrementSP.
			aChip8 pc: (aChip8 stackAt: (aChip8 sp)) + 2.
		]
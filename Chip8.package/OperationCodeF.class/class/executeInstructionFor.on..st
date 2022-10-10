as yet unclassified
executeInstructionFor: anHexOperationCode on: aChip8
	| x  fx07 fx0A fx15 fx18 fx1E fx29 fx33 fx55 fx65 |
	fx07 := 16r0007.
	fx0A := 16r000A.
	fx15 := 16r0015.
	fx18 := 16r0018.
	fx1E := 16r001E.
	fx29 := 16r0029.
	fx33 := 16r0033.
	fx55 := 16r0055.
	fx65 := 16r0065.
	
	x := self opcodeX: anHexOperationCode.
	
	(self opcodeNN: anHexOperationCode ) = fx07 
		ifTrue:[
			"FX07: Set VX to the value of delay_timer"
			aChip8 registerAt: x put: aChip8 delay_timer.
			aChip8  incrementPC.
		].
	
	(self opcodeNN: anHexOperationCode ) = fx0A 
		ifTrue:[
			"A key press is awaited, and then stored in VX"
			0 to: (aChip8 keys size -1) do: [ :idx |
				(aChip8 keyAt: idx) = 1
					ifTrue: [ 
						aChip8 registerAt: x put: idx.
						aChip8 incrementPC.
						^ self. "should break?" ]]
		].
	
	(self opcodeNN: anHexOperationCode ) = fx15 
		ifTrue: [
			"FX15: Sets the delay timer to VX"
			aChip8 delay_timer: (aChip8 registerAt: x).
			aChip8 incrementPC.
		].
		
	(self opcodeNN: anHexOperationCode ) = fx18 
		ifTrue: [
			"FX18: Sets the sound timer to VX"
			aChip8 sound_timer: (aChip8 registerAt: x).
			aChip8 incrementPC.
		].
	
	(self opcodeNN: anHexOperationCode ) = fx1E
		ifTrue: [
			"FX1E: Adds VX to I"
			aChip8 i: aChip8 i + (aChip8 registerAt: x).
			aChip8 incrementPC.
		].
	
	(self opcodeNN: anHexOperationCode ) = fx29
		ifTrue: [
			"Sets I to the location of the sprite for the character VX (Fontset)"
			| character |
			character := aChip8 registerAt: x.
			aChip8 i: 16r050 + (character * 5).
			"aChip8 i: character * 16r5."
			aChip8 incrementPC. 
		].
	
	(self opcodeNN: anHexOperationCode ) = fx33
		ifTrue: [
			"FX33 Store a binary-coded decimal value VX in I, I + 1 and I + 2"
			| valueX |
			valueX := aChip8 registerAt: x.
			aChip8 memoryAt: 0 put:  valueX // 100.
			aChip8 memoryAt: 1 put: (valueX // 10) \\ 10.
			aChip8 memoryAt: 2 put: (valueX \\ 100) \\ 10.
			aChip8 incrementPC.
		].

	(self opcodeNN: anHexOperationCode ) = fx55
		ifTrue: [
			"FX55 Stores V0 to VX in memory starting at address I"
			0 to: x do: [ :idx |
				aChip8 memoryAt: idx put: (aChip8 registerAt: idx) ].
			aChip8 i: (aChip8 i + x + 1).
			aChip8 incrementPC.
		].
	
	(self opcodeNN: anHexOperationCode ) = fx65
		ifTrue: [
			"FX65 Fills V0 to VX with values from I"
			0 to: x do: [ :idx |		
				aChip8 registerAt: idx put: (aChip8 memoryAt: idx) ].
			aChip8 i: (aChip8 i + x + 1).
			aChip8 incrementPC.
		]

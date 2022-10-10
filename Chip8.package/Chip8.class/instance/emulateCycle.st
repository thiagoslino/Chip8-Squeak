emulation
emulateCycle
	| opcode operationCodeClass |
	"memory[pc] << 8 | memory[pc + 1];"
	opcode := ((memory at: pc +1)  bitShift: 8) + (memory at: pc + 2).
	
	operationCodeClass := OperationCode operationCodeClassFor: opcode.
	operationCodeClass isNil
		ifFalse: [ operationCodeClass executeInstructionFor: opcode on: self ].
		
	self tickTimers.
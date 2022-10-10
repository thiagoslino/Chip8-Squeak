emulation
loadProgram: pathToROM
	|string offset |
	FileStream
		readOnlyFileNamed: pathToROM
		do: [:stream | string := stream binary upToEnd. ].
	offset := 1.	
	string do: [ :input |  
		memory at: (16r200 + offset) put: input.
		offset := offset+1. ].
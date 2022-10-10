instance creation
runProgram: aRom
	(self new 
		loadProgram: aRom;
		asMorph) run.
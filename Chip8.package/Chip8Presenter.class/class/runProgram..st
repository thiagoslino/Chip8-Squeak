instance creation
runProgram: aProgram
	|instance|
	instance := self new initializeWithProgram: aProgram.
	
	^instance
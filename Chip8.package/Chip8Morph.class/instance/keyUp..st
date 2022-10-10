event handling
keyUp: anEvent
	"Handle a key up event."
	| keyIndex |
	
	keyIndex := self keyMapping indexOf: (anEvent keyValue asCharacter asLowercase) ifAbsent: [ ^ self ].
	chip keys at: keyIndex put: 0.
event handling
keyDown: anEvent
	"Handle a key down event."
	| keyIndex |
	
	keyIndex := self keyMapping indexOf: (anEvent keyValue asCharacter asLowercase) ifAbsent: [ ^ self ].
	chip keys at: keyIndex put: 1.
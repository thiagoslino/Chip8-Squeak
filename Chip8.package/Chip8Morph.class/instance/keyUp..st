event handling
keyUp: anEvent
	"Handle a key up event."
	| keyIndex |
	
	keyIndex := presenter keyMapping indexOf: (anEvent keyValue asCharacter asLowercase) ifAbsent: [ ^ self ].
	presenter keyAt: keyIndex put: 0.
event handling
keyDown: anEvent
	"Handle a key down event."
	| keyIndex |
	
	keyIndex := self keyMapping indexOf: (anEvent keyValue asCharacter asLowercase) ifAbsent: [ ^ self ].
	presenter keyAt: keyIndex put: 1.
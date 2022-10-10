accessing
registerAt: anPosition put: aNumber
	registers at: anPosition + 1 put: (aNumber bitAnd: 16rFF)
as yet unclassified
opcodeY: anOpcode
	^  (anOpcode bitAnd: 16r00F0) bitShift: -4
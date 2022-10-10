as yet unclassified
opcodeX: anOpcode
	^  (anOpcode bitAnd: 16r0F00) bitShift: -8
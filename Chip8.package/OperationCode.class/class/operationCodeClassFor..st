accessing class hierarchy
operationCodeClassFor: anOperationCode
	| operationCodeClass |
	operationCodeClass := self subclasses 
			detect: [ :cls | cls operationCode =  (anOperationCode bitAnd: 16rF000) ].
	^ operationCodeClass
accessing
speedDown
	self delay = 1 ifTrue: [^ self].
	self delay: self delay - 1
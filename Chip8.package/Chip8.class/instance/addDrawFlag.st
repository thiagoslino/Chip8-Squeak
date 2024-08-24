emulation
addDrawFlag
	self needRedraw: true.
	"communicate to other objects which might be interested"
	self triggerEvent: #needRedraw
emulation
tickTimers
		self sound_timer > 0 
			ifTrue: [
				self sound_timer: self sound_timer - 1.
				self playSound ].
		self delay_timer > 0 
			ifTrue: [ self delay_timer: self delay_timer - 1 ].
emulation
playSound
	self sound_timer = 0
		ifTrue:[ 
			[((AbstractSound soundNamed: 'pluckedElecBass')
				soundForPitch: 400.0 dur: 0.02
				loudness: 0.8) play ] forkNamed: 'BeepSignal' ]
initialize-release
initialize
	super initialize.
	memory := ByteArray new: 4096 withAll: 0.
	registers := ByteArray new: 16 withAll: 0.
	stack := Array new: 16.
	keys := ByteArray new:16 withAll: 0.
	display := IntegerArray new: (64 * 32) withAll: 0.
	pc := 16r200.
	sp := 0.
	i := 0.
	delay_timer := 0.
	sound_timer := 0.
	needRedraw := false.
	self loadFontSet.
	
initialize-release
loadFontSet
	"Loads the fontset into the memory"
	| fontset |
	fontset := self class fontSet.
	1 to: fontset size do: [ :i |
		memory at: (16r050 + i) put: (fontset at: i). ]
	
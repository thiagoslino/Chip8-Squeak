drawing
drawOn: aCanvas
	super drawOn: aCanvas.
	aCanvas
			translateBy: self bounds origin
			clippingTo: self bounds
			during: [:canvas | self repaint value: canvas.]
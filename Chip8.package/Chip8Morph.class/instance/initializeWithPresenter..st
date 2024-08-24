initialization
initializeWithPresenter: aPresenter
	self initialize.
	presenter := aPresenter.
	self extent: presenter defaulExtent.

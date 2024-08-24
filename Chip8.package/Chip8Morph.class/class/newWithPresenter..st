instance creation
newWithPresenter: aPresenter
	|instance|
	instance := self basicNew.
	instance initializeWithPresenter: aPresenter.

	^ instance
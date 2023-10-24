run
run
	| container title footer closeButton speedUpButton speedDownButton |
	container := AlignmentMorph newColumn.
	container color: Color gray.
	container  hResizing: #shrinkWrap; 
	     vResizing: #shrinkWrap.	

	title := StringMorph new 
           contents: 'Chip-8 Emulator'; 
           color: Color white.
     title hResizing: #spaceFill.
	
	closeButton := SimpleButtonMorph new
 		label: 'close x' ;
 		target: container; 
 		actionSelector: #delete.

	speedUpButton := SimpleButtonMorph new
 		label: 'speed +';
 		target: self; 
 		actionSelector: #speedUp.

 	speedDownButton := SimpleButtonMorph new
 		label: 'speed -';
 		target: self; 
 		actionSelector: #speedDown.	
			
	footer := Morph new.
	footer width: self width;
      	height: 30;
		color: Color gray;
		layoutPolicy: TableLayout new;
		cellInset: 2;
		listDirection: #rightToLeft;
		wrapCentering: #topLeft;
		wrapDirection: #topToBottom.

	footer addMorphBack: closeButton.
	footer addMorphBack: speedDownButton.
	footer addMorphBack: speedUpButton.

	container addMorphBack: title.
	container addMorphBack: self.
	container addMorphBack: footer.
	container openInWorld.

	ActiveHand newKeyboardFocus: self
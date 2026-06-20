run
open
	| container title footer button |
	container := AlignmentMorph newColumn.
	container color: Color gray.
	container  hResizing: #shrinkWrap; 
	     vResizing: #shrinkWrap.	

	footer := Morph new.
	footer width: self width;
      	height: 30;
		color: Color gray;
		layoutPolicy: TableLayout new;
		cellInset: 2;
		listDirection: #rightToLeft;
		wrapCentering: #topLeft;
		wrapDirection: #topToBottom.

	title := StringMorph new 
           contents: 'Chip-8 Emulator'; 
           color: Color white.
     title hResizing: #spaceFill.
	
	button := SimpleButtonMorph new
 		label: 'close x' ;
 		target: container; 
 		actionSelector: #delete.
	footer addMorphBack: button.

	button := SimpleButtonMorph new
 		label: 'speed +';
 		target: self; 
 		actionSelector: #speedUp.
	footer addMorphBack: button.
	
 	button := SimpleButtonMorph new
 		label: 'speed -';
 		target: self; 
 		actionSelector: #speedDown.	
	footer addMorphBack: button.

	button := SimpleButtonMorph new
 		label: 'scale +';
 		target: self; 
 		actionSelector: #scaleUp.
	footer addMorphBack: button.

     button := SimpleButtonMorph new
 		label: 'scale -';
 		target: self; 
 		actionSelector: #scaleDown.
	footer addMorphBack: button.

	container addMorphBack: title.
	container addMorphBack: self.
	container addMorphBack: footer.
	container openInWorld.

	ActiveHand newKeyboardFocus: self
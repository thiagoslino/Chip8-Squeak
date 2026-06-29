run
open
	| container title toolbar button |
	container := AlignmentMorph newColumn.
	container color: Color gray.
	container  hResizing: #shrinkWrap; 
	     vResizing: #shrinkWrap.	

	title := StringMorph new 
           contents: 'Chip-8 Emulator'; 
           color: Color white.
     title hResizing: #spaceFill.

	toolbar := Morph new.
	toolbar width: self width;
      	height: 30;
		color: Color gray;
		layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		cellInset: 2;
		listDirection: #leftToRight;
		cellPositioning: #leftCenter;
		wrapCentering: #topLeft;
		wrapDirection: #topToBottom.

	button := SimpleButtonMorph new
 		label: 'speed +';
 		target: self; 
 		actionSelector: #speedUp.
	toolbar addMorphBack: button.
	
 	button := SimpleButtonMorph new
 		label: 'speed -';
 		target: self; 
 		actionSelector: #speedDown.	
	toolbar addMorphBack: button.

	button := SimpleButtonMorph new
 		label: 'scale +';
 		target: self; 
 		actionSelector: #scaleUp.
	toolbar addMorphBack: button.

     button := SimpleButtonMorph new
 		label: 'scale -';
 		target: self; 
 		actionSelector: #scaleDown.
	toolbar addMorphBack: button.

	button := SimpleButtonMorph new
 		label: 'close x' ;
 		target: container; 
 		actionSelector: #delete.
	toolbar addMorphBack: button.

	container addMorphBack: title.
	container addMorphBack: toolbar.
	container addMorphBack: self.
	container openInWorld.

	ActiveHand newKeyboardFocus: self